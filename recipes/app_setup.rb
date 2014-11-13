deploy_to_dir = "/var/src/#{node['app']['name']}"

manage_py = "#{deploy_to_dir}/current/manage.py"

execute "migrate db" do
  command "#{manage_py} syncdb --noinput"
  user node['app']['user']
end

fixtures = ['naics', 'setasides', 'pools']
fixtures.each do |fixture|
  cmd = "#{manage_py} loaddata "
  cmd << "#{deploy_to_dir}/current/vendor/fixtures/#{fixture}.json"
  cmd << "&& touch #{deploy_to_dir}/fixture-#{fixture}"
  execute "load #{fixture} fixture" do
    command cmd
    user node['app']['user']
    creates "#{deploy_to_dir}/fixture-#{fixture}"
  end
end

execute "load vendors" do
  command "#{manage_py} load_vendors && touch #{deploy_to_dir}/load-vendors"
  user node['app']['user']
  creates "#{deploy_to_dir}/load-vendors"
end

execute "collectstatic" do
  command "#{manage_py} collectstatic --noinput"
  user node['app']['user']
end

execute "create cache table" do
  command "#{manage_py} createcachetable"
  user node['app']['user']
end
