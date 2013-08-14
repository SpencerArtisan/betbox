import requests
import json
 
endpoint = "https://api.betfair.com/exchange/betting/rest/v1.0"
 
header = { 'X-Application' : 'Grh0jxIVJFzIaAl2', 'X-Authentication' : 'QbdK5gJDyDANBlWFfbaUswFbkWJcfUW7jUF/n9pAKQE=' ,'content-type' : 'application/json' }
 
json_req='{"filter":{ }}'
 
url = endpoint + "/listEventTypes/"
 
response = requests.post(url, data=json_req, headers=header)
 
 
print json.dumps(json.loads(response.text), indent=3)
