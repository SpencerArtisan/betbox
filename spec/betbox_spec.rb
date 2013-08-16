require 'betbox'
require 'timecop'

describe BetBox do
  let(:market) { double  }

  before do
    Timecop.freeze Time.local(2008, 9, 1, 10, 5, 0)
  end

  it 'should log market data to a csv' do
    market.stub(:prices).and_return([{selection_name: 'selection 1', data: 'data 1'}], [{selection_name: 'selection 2', data: 'data 2'}])
    output = BetBox.new.log market, 2, 0, res = ""
    expect(output).to eq "Time,selection 1/selection_name,selection 1/data\n01-09-2008 10:05:00,selection 1,data 1\n01-09-2008 10:05:00,selection 2,data 2\n"
  end
end
