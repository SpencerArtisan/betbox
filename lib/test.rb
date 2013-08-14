require 'rest_client'
require 'json'

endpoint = "https://api.betfair.com/exchange/betting/rest/v1.0"
url = "#{endpoint}/listEventTypes/"
data = '{ "filter": {} }'
resource = RestClient::Resource.new endpoint, headers: { 'X-Application' => 'Grh0jxIVJFzIaAl2', 'X-Authentication' => 'QbdK5gJDyDANBlWFfbaUswFbkWJcfUW7jUF/n9pAKQE=' ,'content-type' => 'application/json' }
response = resource['listEventTypes/'].post data, content_type: 'json', accept: 'json'
d = JSON.parse response
puts d.class
puts d

