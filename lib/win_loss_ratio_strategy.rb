class WinLossRatioStrategy
  def initialize odds
    @odds = odds
  end

  def take_bet?
    (1 - 1.0 / @odds.player_a_win) * @odds.player_b_win >= 1
  end
end
