# set up the database
include_recipe 'postgresql::client'
include_recipe 'user'
include_recipe 'mirage::ec2_vars'
include_recipe 'mirage::dump_loader'
include_recipe 'shipper'

deploy_to_dir = "/var/src/#{node['app']['name']}"

# set up user and group
group node['app']['group']

user_account node['app']['user'] do
  gid node['app']['group']
  action :create
end

shared_files = {
  "config/local_settings.py" => "mirage/local_settings.py"
}

deploy_branch deploy_to_dir do
  repo node['app']['repo']
  revision "master"
  user node['app']['user']
  migrate false
  shallow_clone true
  action :deploy # or :rollback
  purge_before_symlink shared_files.values
  create_dirs_before_symlink []
  symlink_before_migrate shared_files
  symlinks shared_files
  # restart_command "touch tmp/restart.txt"
end

python_virtualenv "#{deploy_to_dir}/venv" do
  owner node['app']['user']
  group node['app']['group']
  action :create
end

venv_bin_path = "#{deploy_to_dir}/venv/bin"

directory "#{deploy_to_dir}/shared/config" do
  owner node['app']['user']
  recursive true
end

template "#{deploy_to_dir}/shared/config/local_settings.py" do
  source 'local_settings.py.erb'
  variables(
    db_name: node['app']['database']['name'],
    db_user: node['app']['database']['username'],
    db_host: node['app']['database']['host'],
    db_pass: node['app']['database']['password'],
    secret_key: node['app']['secret_key'],
    aws_access_key_id: node['app']['s3']['access_key_id'],
    aws_secret_access_key: node['app']['s3']['secret_access_key'],
    sam_api_key: node['app']['sam_api_key']
  )
end


file "/etc/ssl/server.key" do
  action :create
  owner  "root"
  group  "root"
  mode   "0644"
  content node['app']['ssl']['key']
end

file "/etc/ssl/server.crt" do
  action :create
  owner  "root"
  group  "root"
  mode   "0644"
  content node['app']['ssl']['cert']
end

service 'nginx' do
  supports status: true, restart: true, reload: true
  action   :restart
end

nginx_folder = "/etc/nginx/vhosts"
nginx_folder = "/etc/nginx/conf.d" if !File.exist?(nginx_folder)

template "#{nginx_folder}/#{node['app']['name']}.conf" do
  source "nginx.conf.erb"
  notifies :restart, "service[nginx]"
  variables(
    working_dir: "#{deploy_to_dir}/current",
    app_id: node['app']['name'],
    cert_path: "/etc/ssl/server.crt",
    cert_key_path: "/etc/ssl/server.key"
  )
end

file "#{nginx_folder}/default.conf" do
  action :delete
end

execute "install pip packages" do
  command "#{venv_bin_path}/pip install -r #{deploy_to_dir}/current/requirements.txt"
  user node['app']['user']
end

execute "install pip packages for python 2" do
  command "#{venv_bin_path}/pip install -r #{deploy_to_dir}/current/requirements_py2.txt"
  user node['app']['user']
end

python_pip "gunicorn" do
  virtualenv "#{deploy_to_dir}/venv"
end

# Add upstart script
template "/etc/init/#{node['app']['name']}.conf" do
  source "app.upstart.erb"
  variables(
    working_dir: "#{deploy_to_dir}/current",
    app_id: node['app']['name'],
    app_user: node['app']['user']
  )
  owner  "root"
  group  "root"
  mode   "0644"
end

service node['app']['name'] do
  provider Chef::Provider::Service::Upstart
  action   [:enable, :start]
end

shipper_config "mirage" do
  repository node['app']['repo']
  environment node['app']['environment']
  app_path deploy_to_dir
  app_user node['app']['user']
  github_key node['github_key']
  shared_files shared_files
  before_symlink [
    "#{venv_bin_path}/pip install -r requirements.txt",
    "#{venv_bin_path}/pip install -r requirements_py2.txt",
    "#{venv_bin_path}/python manage.py collectstatic --noinput"
  ]
  after_symlink [
    "kill -HUP `status mirage | egrep -oi '([0-9]+)$'`"
  ]
end
