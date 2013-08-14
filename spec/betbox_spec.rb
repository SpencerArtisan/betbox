require 'betbox'

describe BetBox do
  let (:betbox) { BetBox.new }

  it 'should use a ratio strategy to determine whether to bet' do
    market = double id: 110508119
    betbox.watch market, 100
  end
end
