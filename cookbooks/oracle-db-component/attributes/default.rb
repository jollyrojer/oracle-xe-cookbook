include_attribute "oracle_db"

default[:oracle_db_component][:db][:username] = "system"
default[:oracle_db_component][:db][:password] = node[:oracle_db][:xe_config][:admin_password] 
default[:oracle_db_component][:db][:connector_url] = nil
default[:oracle_db_component][:db][:host] = "localhost"
default[:oracle_db_component][:db][:port] = node[:oracle_db][:xe_config][:listener_port] 
default[:oracle_db_component][:db][:sid] = "XE"

default[:oracle_db_component][:schema][:username] = nil
default[:oracle_db_component][:schema][:password] = nil
default[:oracle_db_component][:schema][:hostname] = node[:oracle_db_component][:db][:host]
default[:oracle_db_component][:schema][:port] = node[:oracle_db_component][:db][:port]
default[:oracle_db_component][:schema][:permissions] = nil
