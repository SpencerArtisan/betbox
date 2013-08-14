require 'win_loss_ratio_strategy'
require 'market'

class BetBox
  def watch market, loops
    strategy = WinLossRatioStrategy.new(Market.new market.id)
    1.upto loops do 
      strategy.take_bet?
      sleep 2
    end
  end
end
