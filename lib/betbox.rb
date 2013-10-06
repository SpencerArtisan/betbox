require 'ruby_ext'

class BetBox
  def log match, loops, frequency, target = $stdout
    CSV(target) do |row|
      1.upto loops do 
        add_row match, row
      end
    end
    target
  end

  def add_row match, row
    odds = match.odds
    time = Time.now.strftime "%d-%m-%Y %H:%M:%S" 
    hash_row = {Time: time, Player1: odds.player1, Player2: odds.player2}
    row.add_hash_row hash_row
  end
end
