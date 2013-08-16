require 'ruby_ext'

describe Array do
  it 'should be convertible to a hash' do
    result = [:a, :b].to_hash {|entry| "#{entry} entry"}
    expect(result).to eq({'a entry' => :a, 'b entry' => :b})
  end
end
