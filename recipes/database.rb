# Set up postgres with root password
include_recipe 'postgresql::server'
include_recipe 'postgresql::client'
include_recipe 'database::postgresql'

# Set up databases and users

db_connection_info = {
  host: node['app']['database']['host'],
  username: 'postgres',
  password: node['postgresql']['password']['postgres'],
  port: node['app']['database']['port']
}

postgresql_database node['app']['database']['name'] do
  connection db_connection_info
  action :create
end

postgresql_database_user node['app']['database']['username'] do
  connection db_connection_info
  password node['app']['database']['password']
  action :create
end

postgresql_database_user node['app']['database']['username'] do
  connection db_connection_info
  database_name node['app']['database']['name']
  privileges [:all]
  action :grant
end
