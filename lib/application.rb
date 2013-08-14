require 'betbox'
require 'market'
require 'ostruct'
require 'httpi'

begin
  HTTPI.log = false
  market_id = ARGV[0].to_i
  BetBox.new.watch Market.new(market_id), 50
rescue Exception => e
  puts e.to_s
end
