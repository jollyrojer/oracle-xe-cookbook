#
# LWPR for Oracle DB run query 
#

def load_current_resource
  Gem.clear_paths
  require 'oci8'
  @current_resource = Chef::Resource::OracleDatabaseUser.new(@new_resource.name)
  @current_resource.username(@new_resource.name)
  @current_resource
end

def close
  @db.close rescue nil
  @db = nil
end

def db
  @db ||= begin
    connection = OCI8.new(
      @new_resource.connection[:username],
      @new_resource.connection[:password],
      "//#{new_resource.connection[:host]}:#{new_resource.connection[:port]}/#{new_resource.connection[:sid]}"
    )
    connection
  end
end

def exists?
  data = db.exec("SELECT USERNAME FROM DBA_USERS WHERE USERNAME=\'#{@new_resource.username.upcase}\'")
  data.fetch
  data.row_count!=0
end

action :query do
  if exists?
    begin
      Chef::Log.info("Run query on Oracle database [#{@new_resource.sql_query}]")
      db.exec(@new_resource.sql_query)
      @new_resource.updated_by_last_action(true)
    ensure
      close
    end
  end
end

