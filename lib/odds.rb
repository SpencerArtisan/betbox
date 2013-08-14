class Odds
  def initialize 
    @market = market
  end

  def player_a_win
    @market.prices[0][:b1]
  end

  def player_b_win
    @market.prices[1][:b1]
  end
end
