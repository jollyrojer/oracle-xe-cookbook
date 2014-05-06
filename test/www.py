import requests

url="http://54.83.170.141:8080/test"
response = requests.get(url, auth=requests.auth.HTTPBasicAuth('test', '123'))
print response.status_code
print response.headers
print response.history
assert response.status_code != 401
