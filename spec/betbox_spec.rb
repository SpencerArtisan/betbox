require 'betbox'

describe BetBox do
  it 'should log market data to a csv' do
    market = double 
    market.stub(:prices).and_return({data: 'data 1', more_data: 'more data 1'}, {data: 'data 2', more_data: 'more data 2'})
    output = BetBox.new.log market, 2, 0
    expect(output).to eq "data,more_data\ndata 1,more data 1\ndata 2,more data 2\n"
  end
end
