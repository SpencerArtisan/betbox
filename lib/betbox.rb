require 'win_odds_strategy'
require 'market'

class BetBox
  def watch market, loops
    strategy = WinOddsStrategy.new market
    1.upto loops do 
      strategy.take_bet?
      sleep 2
    end
  end
end
