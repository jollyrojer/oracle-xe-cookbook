#
# LWPR for Oracle DB run single row query 
#

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

action :query do
  require 'oci8'
  begin
    Chef::Log.info("Run single row query on Oracle database [#{@new_resource.sql_query}]")
    db.exec(@new_resource.sql_query)
    @new_resource.updated_by_last_action(true)
  ensure
    close
  end
end

