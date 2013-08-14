require 'betbox'
require 'ostruct'
require 'httpi'

HTTPI.log = false
market = OpenStruct.new id: ARGV[0].to_i
BetBox.new.watch market, 50
