require 'betbox'
require 'market'
require 'ostruct'
require 'httpi'
require 'csv'

begin
  HTTPI.log = false
  market_id, loops, frequency = ARGV[0].to_i, ARGV[1].to_i, ARGV[2].to_i
  market = Market.new(market_id)
  #BetBox.new.try_strategies market, loops, frequency, WinOddsStrategy.new, LayOddsStrategy.new
  BetBox.new.log market, loops, frequency
rescue Exception => e
  puts e
end
