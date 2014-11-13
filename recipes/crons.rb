deploy_to_dir = "/var/src/#{node['app']['name']}"

manage_py = "#{deploy_to_dir}/current/manage.py"

['load_fpds', 'check_sam'].each do |cmd|
  cron cmd do
    action :create
    minute "0"
    hour "1"
    weekday "*"
    home deploy_to_dir
    command "#{manage_py} #{cmd}"
  end

  execute "run cron #{cmd}" do
    command "#{manage_py} #{cmd} && touch #{deploy_to_dir}/#{cmd}"
    user node['app']['user']
    creates "#{deploy_to_dir}/#{cmd}"
  end
end
