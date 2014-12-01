import os

from qubell.api.testing import *

@environment({
    #"default": {},
    "AmazonEC2_CentOS_64": {
        "policies": [{
            "action": "provisionVms",
            "parameter": "imageId",
            "value": "us-east-1/ami-bf5021d6"
        }, {
            "action": "provisionVms",
            "parameter": "vmIdentity",
            "value": "root"
        }]
    }
})
class OracleDBTestCase(BaseComponentTestCase):
    name = "component-oracle-db-xe"
    apps = [{
        "name": name,
        "file": os.path.realpath(os.path.join(os.path.dirname(__file__), '../%s.yml' % name))
    }]
    @classmethod
    def timeout(cls):
        return 25
    @instance(byApplication=name)
    @values({"db-port": "port", "db-host": "host"})
    def test_port(self, instance, host, port):
        import socket

        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        result = sock.connect_ex((str(host), int(port)))

        assert result == 0

    @instance(byApplication=name)
    @workflow("manage.user", {
        "db-user": "test",
        "db-user-password": "123",
        "db-user-privileges": '["ALL"]',
	"db-user-management-action": '["create","grant"]'
    })
    @values({"db-host": "host"})
    def test_check_user_create(self, instance, host):
      import socket
      import requests 
      import pdb
      
      timeout = 10
      socket.setdefaulttimeout(timeout)
      
      url = "http://%s:%s/test"%(host, "8080")
      response = requests.get(url, auth=requests.auth.HTTPBasicAuth('test', '123'))
      print response.status_code
      assert response.status_code != 401
