require 'win_odds_strategy'
require 'lay_odds_strategy'
require 'market'
require 'ruby_ext'

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
  ensure
    market.close
  end

  def log market, loops, frequency
    CSV.generate do |csv|
      1.upto loops do 
        prices = market.prices
        hash_row = prices.to_hash {|row| row[:selection_name]}
        csv.add_hash_row hash_row
        sleep frequency
      end
    end
  end
end
