class WinOddsStrategy
  def initialize market
    @market = market
  end

  def take_bet?
    odds = @market.odds
    ratio = (1 - 1.0 / odds.player_a_win) * odds.player_b_win
    puts "Ratio is #{ratio} (Bet odds are #{odds.player_a_win} and #{odds.player_b_win})"
    ratio >= 1
  end
end
