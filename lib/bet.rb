require 'betfair'

bf = Betfair::API.new
helpers = Betfair::Helpers.new

username            = 'spencerward'
password            = 'atheistb1'
product_id          = 82
vendor_software_id  = 0
location_id         = 0
ip_address          = nil
session_token = bf.login(username, password, product_id, vendor_software_id, location_id, ip_address)
puts session_token

exchange_id     = 1       # 1 == UK, 2 == AUS
event_type_ids  = [1,3]   # Full list here http://data.betfair.com/sportids.htm
locale          = nil 
countries       = nil 
from_date       = Time.now.utc
to_date         = Time.now.utc + 1000
#markets = bf.get_all_markets(session_token, exchange_id, event_type_ids, locale, countries, from_date, to_date)
#puts "**********all_markets"
#puts helpers.all_markets markets

market_id     = 110508119
market = bf.get_market(session_token, exchange_id, market_id, locale)
puts "**********market_info"
puts helpers.market_info market

currency_code = nil
prices = bf.get_market_prices_compressed(session_token, exchange_id, market_id, currency_code)
puts "**********prices"
puts helpers.prices prices

puts "**********combine"
puts helpers.combine market, prices

puts "**********details"
puts helpers.details market

puts "**********prices_complete"
puts helpers.prices_complete prices

puts "**********price_string"
puts helpers.price_string prices, true

bf.logout session_token
