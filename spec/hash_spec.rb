require 'hash'

describe Hash do
  it 'should flatten a deep hash' do
    deep_hash = {
      :a => {
        :b => {:c => 1, :d => 2},
        :e => 3,
      },
      :f => 4,
    }
    expect(deep_hash.flat_hash).to eq (
    {
      [:a, :b, :c] => 1,
      [:a, :b, :d] => 2,
      [:a, :e] => 3,
      [:f] => 4,
    })
  end
end
