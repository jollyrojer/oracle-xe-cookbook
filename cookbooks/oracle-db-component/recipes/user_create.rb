ENV["ORACLE_HOME"] = "#{node[:oracle_db][:installation_dir]}/app/oracle/product/11.2.0/xe"
ENV["NLS_LANG"] = "#{node[:oracle_db][:nls_lang]}"

oracle_database_user node[:oracle_db_component][:schema][:username] do
  connection node[:oracle_db_component][:db]
  password node[:oracle_db_component][:schema][:password]
  action :create
end

oracle_database_user node[:oracle_db_component][:schema][:username] do
  connection node[:oracle_db_component][:db]
  privileges node[:oracle_db_component][:schema][:permissions]
  action :grant
end
