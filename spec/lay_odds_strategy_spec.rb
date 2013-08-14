require 'lay_odds_strategy'

describe LayOddsStrategy do
  let (:odds) { double }
  let (:strategy) { LayOddsStrategy.new }

  it 'should place a lay bet if the factor is zero' do
    odds.stub player_a_lay: 2
    odds.stub player_b_lay: 2
    expect(strategy.take_bet? odds).to be_true
  end

  it 'should place a bet if the factor is above zero' do
    odds.stub player_a_lay: 1.99
    odds.stub player_b_lay: 1.99
    expect(strategy.take_bet? odds).to be_true
  end

  it 'should not place a bet if the factor is below zero' do
    odds.stub player_a_lay: 2.01
    odds.stub player_b_lay: 2.01
    expect(strategy.take_bet? odds).to be_false
  end
end
