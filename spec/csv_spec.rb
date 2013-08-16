require 'hash'
require 'ruby_ext'

describe CSV do
  it 'should convert a simple hash to a csv with headers' do
    output = CSV.generate do |csv|
      csv.add_hash_row({column1: 'Hello', column2: 'World'})
      csv.add_hash_row({column1: 'Good', column2: 'bye'})
    end
    expect(output).to eq "column1,column2\nHello,World\nGood,bye\n"
  end

  it 'should convert a complex hash' do
    output = CSV.generate do |csv|
      csv.add_hash_row({column1: 'Hello', name: {first: 'Spencer', second: 'Ward'}})
    end
    expect(output).to eq "column1,name/first,name/second\nHello,Spencer,Ward\n"
  end
end
