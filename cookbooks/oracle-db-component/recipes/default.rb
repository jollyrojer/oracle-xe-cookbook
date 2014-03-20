#
# Cookbook Name:: oracle-db-component
# Recipe:: default
#
package "unzip"
package "bc"

package "yum" do
  action :upgrade
end

include_recipe "oracle_db"

case node["platform_family"]
  when "rhel"
    service "iptables" do
      action :stop
    end
  end
