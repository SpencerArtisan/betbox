#   Lay     Stake
#A  a=2.12  x
#B  b=2.06  1-x
#If A loses, you win 1 - b(1-x)
#If B loses, you win 1 - ax
#For sure profit, 1-b(1-x)>0 and 1-ax>0
#So, assuming 1-ax=0(x=1/a), then 1-b(1-1/a)>0
class LayOddsStrategy
  def take_bet? odds
    factor = 1 - odds.player_b_lay * (1 - 1.0 / odds.player_a_lay)
    puts "Lay Factor is #{factor} (Lay odds are #{odds.player_a_lay} and #{odds.player_b_lay})"
    factor >= 0
  end
end
