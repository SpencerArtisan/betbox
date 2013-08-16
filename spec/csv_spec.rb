require 'hash'
require 'csv'

class CSV
  def add_hash_row hash
    hash = hash.flat_hash
    if @lineno == 0
      headers = hash.keys.map {|column_names| column_names.join '_'}
      self << headers
    end
    self << hash.values
  end

  def self.generate_from_hashes rows
    rows.map! &:flat_hash
    generate do |csv|
      headers = rows[0].keys.map {|column_names| column_names.join '_'}
      csv << headers
      rows.each { |row| csv << row.values }
    end
  end
end

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
    expect(output).to eq "column1,name_first,name_second\nHello,Spencer,Ward\n"
  end
end
