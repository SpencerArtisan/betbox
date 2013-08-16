require 'ostruct'

Odds = Struct.new :player_a_win, :player_b_win, :player_a_lay, :player_b_lay do
  def initialize prices
    raise "Can only deal with 2 outcomes.  This market has #{prices.length} outcomes."
    self.player_a_win = prices[0][:b1]
    self.player_a_lay = prices[0][:l1]
    self.player_b_win = prices[1][:b1]
    self.player_b_lay = prices[1][:l1]
    puts "#{player_a_win}|#{player_a_lay}"
    puts "#{player_b_win}|#{player_b_lay}"
    raise "Incomplete odds" if player_a_win == 0 or player_b_win == 0 or player_a_lay == 0 or player_b_lay == 0
  end
end

