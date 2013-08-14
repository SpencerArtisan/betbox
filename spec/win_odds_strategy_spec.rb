require 'win_odds_strategy'

describe WinOddsStrategy do
  let (:odds) { double }
  let (:strategy) { WinOddsStrategy.new }

  it 'should place a bet if the ratio is one' do
    odds.stub player_a_win: 2
    odds.stub player_b_win: 2
    expect(strategy.take_bet? odds).to be_true
  end

  it 'should place a bet if the ratio is above one' do
    odds.stub player_a_win: 2.01
    odds.stub player_b_win: 2.01
    expect(strategy.take_bet? odds).to be_true
  end

  it 'should not place a bet if the ratio is below one' do
    odds.stub player_a_win: 1.99
    odds.stub player_b_win: 1.99
    expect(strategy.take_bet? odds).to be_false
  end
end
