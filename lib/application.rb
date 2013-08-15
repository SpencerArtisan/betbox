require 'betbox'
require 'market'
require 'ostruct'
require 'httpi'

begin
  HTTPI.log = false
  market_id = ARGV[0].to_i
  loops = ARGV[1].to_i
  frequency = ARGV[2].to_i
  BetBox.new.watch Market.new(market_id), loops, frequency
rescue Exception => e
  puts e
end
