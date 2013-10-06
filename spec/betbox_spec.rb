require 'betbox'
require 'timecop'

describe BetBox do
  let(:market) { double  }

  before do
    Timecop.freeze Time.local(2008, 9, 1, 10, 5, 0)
  end

  it 'should log market data to a csv' do
    odds1 = double player1: 1.2, player2: 3.4
    odds2 = double player1: 5.6, player2: 7.8
    match = double
    match.stub(:odds).and_return odds1, odds2

    output = BetBox.new.log match, 2, 0, res = ""
    expect(output).to eq %{Time,Player1,Player2
01-09-2008 10:05:00,1.2,3.4
01-09-2008 10:05:00,5.6,7.8
}
  end
end
