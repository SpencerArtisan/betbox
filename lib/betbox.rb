require 'win_odds_strategy'
require 'lay_odds_strategy'
require 'market'

class BetBox
  def watch market, loops, frequency
    strategies = WinOddsStrategy.new, LayOddsStrategy.new
    1.upto loops do 
      odds = market.odds
      strategies.each do |strategy|
        bet = strategy.take_bet? odds
        puts "*************** SURE FIRE PROFIT!!! ****************" if bet
      end
      sleep frequency
    end
  ensure
    market.close
  end
end
