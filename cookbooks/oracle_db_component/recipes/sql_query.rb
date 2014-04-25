#
# Cookbook Name:: oracle-db-component
# Recipe:: Oracle run single query
#
# Copyright 2014, Qubell
#
# All rights reserved - Do Not Redistribute
#

ENV["ORACLE_HOME"] = "#{node[:oracle_db][:installation_dir]}/app/oracle/product/11.2.0/xe"
ENV["NLS_LANG"] = "#{node[:oracle_db][:nls_lang]}"

oracle_db_single_query node[:oracle_db_component][:sql_row] do
  connection node[:oracle_db_component][:schema]
  sql_query node[:oracle_db_component][:sql_row]
  action :query
end
