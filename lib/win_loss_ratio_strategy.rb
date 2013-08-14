class WinLossRatioStrategy
  def initialize market
    @market = market
  end

  def take_bet?
    odds = @market.odds
    ratio = (1 - 1.0 / odds.player_a_win) * odds.player_b_win
    puts "Ratio is #{ratio}"
    ratio >= 1
  end
end
