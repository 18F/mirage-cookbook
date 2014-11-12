if node['mirage']['dump_path']
  execute "copy dump" do
    command "cp #{node['mirage']['dump_path']} /tmp/db_dump.sql.gz"
    creates "/tmp/db_dump.sql.gz"
  end

  execute "gunzip dump" do
    command "gunzip /tmp/db_dump.sql.gz"
    creates "/tmp/db_dump.sql"
  end

  restore_cmd = [ "pg_restore --clean -O",
                  "-h #{node['app']['database']['host']}",
                  "-d #{node['app']['database']['name']}",
                  "-p #{node['app']['database']['port']}",
                  "-u #{node['app']['database']['username']}",
                  "-f /tmp/db_dump.sql",
                  "; touch /tmp/dump_loaded"
                ].join(" ")


  execute "load into db" do
    command restore_cmd
    environment = {
      'PGPASSWORD' => node['app']['database']['password']
    }
    creates "/tmp/dump_loaded"
  end
end
