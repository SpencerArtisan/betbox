class WinOddsStrategy
  def take_bet? odds
    factor = (1 - 1.0 / odds.player_a_win) * odds.player_b_win
    puts "Bet Factor is #{factor} (Bet odds are #{odds.player_a_win} and #{odds.player_b_win})"
    factor >= 1
  end
end
