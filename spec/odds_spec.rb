require 'odds'

describe Odds do
  let (:market) { double }
  let (:odds) { Odds.new market }

  it 'should extract the best player a win odds from the market api' do
    market.stub prices: [{b1: 1.23}, {b1: 4.56}]
    expect(odds.player_a_win).to eq 1.23
  end

  it 'should extract the best player b win odds from the market api' do
    market.stub prices: [{b1: 1.23}, {b1: 4.56}]
    expect(odds.player_b_win).to eq 4.56
  end
end
