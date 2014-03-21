#
# Resource for Oracle DB user management
#

actions :create, :drop, :grant, :query

attribute :connection, :kind_of => Hash, :default => {}
attribute :username, :kind_of => String, :name_attribute => true
attribute :password, :kind_of => String, :name_attribute => true
attribute :privileges, :kind_of => Array 
