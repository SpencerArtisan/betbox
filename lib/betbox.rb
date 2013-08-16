require 'win_odds_strategy'
require 'lay_odds_strategy'
require 'market'
require 'ruby_ext'
require 'odds'

class BetBox
  def try_strategies market, loops, frequency, *strategies
    1.upto loops do 
      odds = Odds.new market.prices
      strategies.each do |strategy|
        bet = strategy.take_bet? odds
        puts "*************** SURE FIRE PROFIT!!! ****************" if bet
      end
      sleep frequency
    end
  end

  def log market, loops, frequency, target = $stdout
    CSV(target) do |csv|
      1.upto loops do 
        prices = market.prices
        hash_row = prices.to_hash {|row| row[:selection_name]}
        time = Time.now.strftime("%d-%m-%Y %H:%M:%S")
        hash_row = {Time: time}.merge hash_row
        csv.add_hash_row hash_row
        sleep frequency
      end
    end
    target
  end
end
