require 'betbox'

describe BetBox do
  it 'should log market data to a csv' do
    market = double 
    market.stub(:prices).and_return([{selection_name: 'selection 1', data: 'data 1'}], [{selection_name: 'selection 2', data: 'data 2'}])
    output = BetBox.new.log market, 2, 0
    expect(output).to eq "selection 1/selection_name,selection 1/data\nselection 1,data 1\nselection 2,data 2\n"
  end
end
