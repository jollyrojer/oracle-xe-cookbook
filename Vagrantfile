VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  #CentOS 6.3
  config.vm.define "centos63" do |centos63_config|
    centos63_config.vm.box = "centos_6_x64"
    centos63_config.vm.box_url = "/Users/jolly_rojer/Projects/Cometera/vagrant-boxes/centos_6_x64.box"
    centos63_config.vm.hostname = "centos63.qubell.int"
    centos63_config.vm.network "forwarded_port", guest: 8080, host: 9010, auto_correct: true
    centos63_config.vm.network "public_network", :bridge => 'en0: Wi-Fi (AirPort)'
    centos63_config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--cpus", "2"]
    end
    centos63_config.vm.provision "chef_solo" do |chef| 
      chef.log_level = "debug"
      chef.cookbooks_path = ["cookbooks"]
      chef.add_recipe "oracle-db-component"
      chef.add_recipe "oracle-db-component::user_create"
        chef.json = {
          "oracle_db" => {
             "url" => "https://s3.amazonaws.com/ab-atg/oracle-xe-11.2.0-1.0.x86_64.rpm.zip",
             "installation_dir" => "/opt/oracle_xe",
             "tmp_dir" => "/opt/tmp",
             "swap_dir" => "/opt",
             "xe_config" => {
                "admin_password" => "123QweAsd"}
          },
          "oracle_db_component" => {
            "schema" => {
               "username" => "testuser",
                "password" => "!23TestPass",
                "permissions" => ["all"]
            }
          }
        }
    end
  end
end
