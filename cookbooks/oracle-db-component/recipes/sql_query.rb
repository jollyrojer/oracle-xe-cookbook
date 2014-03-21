#
# Cookbook Name:: oracle-db-component
# Recipe:: Oracle run query
#
# Copyright 2014, Qubell
#
# All rights reserved - Do Not Redistribute
#

ENV["ORACLE_HOME"] = "#{node[:oracle_db][:installation_dir]}/app/oracle/product/11.2.0/xe"
ENV["NLS_LANG"] = "#{node[:oracle_db][:nls_lang]}"

sql_f = node['oracle-component']['sql_url']
sql_f.each_index do |i|
  sql_file = Chef::Config[:file_cache_path] + "/query#{i}.sql"
  remote_file sql_file do
    source sql_f[i]
    mode "0644"
    action :create
  end

  oracle_db_sql "run #{sql_file}" do
    connection node[:oracle_db_component][:scheme]
    sql_query { ::File.open("#{sql_file}").read }
    action :query
  end
end
