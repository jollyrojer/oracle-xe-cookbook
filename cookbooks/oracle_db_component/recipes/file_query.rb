#
# processing Oracle DB sql file
#

sql_f = node['oracle_db_component']['sql_url']
sql_f.each_index do |i|
  sql_file = Chef::Config[:file_cache_path] + "/query#{i}.sql"
  remote_file sql_file do
    source sql_f[i]
    mode "0644"
    action :create
  end
 

  bash "processing #{sql_file}" do
    user 'root'
    code <<-EOH
    source /etc/profile.d/oracle_xe.sh
    sqlplus -S '#{node[:oracle_db_component][:schema][:username]}/#{node[:oracle_db_component][:schema][:password]}' @#{sql_file}
    EOH
  end
end
