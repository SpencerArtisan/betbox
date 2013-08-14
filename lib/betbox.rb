require 'win_loss_ratio_strategy'
require 'odds'
require 'market'

class BetBox
  def watch market, loops
    strategy = WinLossRatioStrategy.new(Market.new market.id)
    1.upto loops
      strategy.take_bet?
  end
end
