import requests
 
#openssl x509 -x509toreq -in certificate.crt -out CSR.csr -signkey privateKey.key
 
 
payload = 'username=spencerward&password=atheistb1'
headers = {'X-Application': 'b7cb8f08591046c152671eb1c7e9a115acb99fad', 'Content-Type': 'application/x-www-form-urlencoded'}
 
resp = requests.post('https://identitysso-strongauth.betfair.com/api/certlogin', data=payload, cert=('client-2048.crt', 'client-2048.key'), headers=headers)
 
if resp.status_code == 200:
  resp_json = resp.json()
  print resp_json['loginStatus']
  print resp_json['sessionToken']
else:
  print "Request failed."
