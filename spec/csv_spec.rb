require 'hash'
require 'csv'

class CSV
  def self.generate_from_hashes hash_rows
    hash_rows.map! &:flat_hash
    generate do |csv|
      headers = hash_rows[0].keys.map {|column_names| column_names.join '_'}
      csv << headers
      hash_rows.each { |row| csv << row.values }
    end
  end
end

describe 'd' do
  it 'should convert a simple hash to a csv with headers' do
    hash_row_1 = {column1: 'Hello', column2: 'World'}
    hash_row_2 = {column1: 'Good', column2: 'bye'}
    hash_rows = [hash_row_1, hash_row_2]
    expect(CSV.generate_from_hashes hash_rows).to eq "column1,column2\nHello,World\nGood,bye\n"
  end

  it 'should convert a complex hash' do
    row = {column1: 'Hello', name: {first: 'Spencer', second: 'Ward'}}
    expect(CSV.generate_from_hashes [row]).to eq "column1,name_first,name_second\nHello,Spencer,Ward\n"
  end
end
