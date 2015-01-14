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
        "parameters": {"configuration.db-user": "test", "configuration.db-user-password": "123", "configuration.sql-url": '[]', "configuration.db-user-privileges": '["ALL"]'},
        "file": os.path.realpath(os.path.join(os.path.dirname(__file__), '../%s.yml' % name))
    }]
    @classmethod
    def timeout(cls):
        return 25
    @instance(byApplication=name)
    def test_port(self, instance):
        import socket
        host = instance.returnValues['database.db-host']
        port = instance.returnValues['database.db-port']
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        result = sock.connect_ex((str(host), int(port)))

        assert result == 0

    @instance(byApplication=name)
    def test_check_user_create(self, instance):
      import socket
      import requests 
      import pdb
      host = instance.returnValues['database.db-host']
      port = instance.returnValues['database.db-port']  
      timeout = 10
      socket.setdefaulttimeout(timeout)
      
      url = "http://%s:%s/test"%(host, "8080")
      response = requests.get(url, auth=requests.auth.HTTPBasicAuth('test', '123'))
      print response.status_code
      assert response.status_code != 401
