#
# Cookbook Name:: oracle-db-component
# Recipe:: create_user
#
# Copyright 2014, Qubell
#
# All rights reserved - Do Not Redistribute
#

ENV["ORACLE_HOME"] = "#{node[:oracle_db][:installation_dir]}/app/oracle/product/11.2.0/xe"
ENV["NLS_LANG"] = "#{node[:oracle_db][:nls_lang]}"

oracle_db_user node[:oracle_db_component][:schema][:username] do
  connection node[:oracle_db_component][:db]
  password node[:oracle_db_component][:schema][:password]
  privileges node[:oracle_db_component][:schema][:permissions]
  action Array(node[:oracle_db_component][:schema][:action])
end

