#
# Resource for Oracle DB single row query 
#

actions :query

attribute :connection, :kind_of => Hash, :default => {}
attribute :sql_query, :kind_of => String, :name_attribute => true
