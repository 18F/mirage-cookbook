deploy_to_dir = "/var/src/#{node['app']['name']}"
venv_bin_path = "#{deploy_to_dir}/venv/bin"

manage_py = "#{venv_bin_path}/python #{deploy_to_dir}/current/manage.py"

directory "/var/log/cron"

['load_fpds', 'check_sam'].each do |cmd|
  cron cmd do
    action :create
    minute "0"
    hour "1"
    weekday "*"
    home deploy_to_dir
    command "#{manage_py} #{cmd} >> /var/log/cron/#{cmd}.log"
  end
  #
  # execute "run cron #{cmd}" do
  #   command "#{manage_py} #{cmd} && touch #{deploy_to_dir}/#{cmd}"
  #   user node['app']['user']
  #   creates "#{deploy_to_dir}/#{cmd}"
  # end
end
