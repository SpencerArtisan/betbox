require 'betbox'
require 'match'
require 'httpi'
require 'william_hill_feed'

begin
  HTTPI.log = false
  match_name, loops, frequency = ARGV[0], ARGV[1].to_i, ARGV[2].to_i
  match = Match.new match_name, WilliamHillFeed.new
  BetBox.new.log match, loops, frequency
end
