require 'match'

describe Match do
  it 'should extract the odds from the William Hill feed' do
    feed_data = [{name: 'dummy match'}, {:id=>"115733880", :name=>"Jack Sock. v Michael Russell - Match Betting Live", :participants=>[{:id=>"416315278", :name=>"Michael Russell", :odds=>"1.62"}, {:id=>"416315277", :name=>"Jack Sock.", :odds=>"2.20"}]}]
    feed = double data: feed_data
    match = Match.new "Jack Sock. v Michael Russell", feed
    odds = match.odds
    expect(odds.player1).to eq 1.62
    expect(odds.player2).to eq 2.20
  end
end
