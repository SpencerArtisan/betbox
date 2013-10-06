require 'ostruct'

class Match
  def initialize name, feed
    @name = "#{name} - Match Betting Live"
    @feed = feed
  end

  def odds
    data = @feed.data.find {|data_row| data_row[:name] == @name}
    raise "No such match #{@name} in feed" unless data
    OpenStruct.new player1: data[:participants][0][:odds].to_f,  player2: data[:participants][1][:odds].to_f
  end
end
