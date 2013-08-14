require 'win_loss_ratio_strategy'

describe WinLossRatioStrategy do
  let (:odds) { double }
  let (:strategy) { WinLossRatioStrategy.new odds }

  it 'should place a bet if the ratio is one' do
    odds.stub player_a_win: 2
    odds.stub player_b_win: 2
    expect(strategy.take_bet?).to be_true
  end

  it 'should not place a bet if the ratio is below one' do
    odds.stub player_a_win: 1.99
    odds.stub player_b_win: 1.99
    expect(strategy.take_bet?).to be_false
  end
end
