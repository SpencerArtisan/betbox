require 'betfair'
require 'ostruct'

Odds = Struct.new :player_a_win, :player_b_win, :player_a_lay, :player_b_lay do
  def initialize prices
    self.player_a_win = prices[0][:b1]
    self.player_a_lay = prices[0][:l1]
    self.player_b_win = prices[1][:b1]
    self.player_b_lay = prices[1][:l1]
    puts "#{player_a_win}|#{player_a_lay}"
    puts "#{player_b_win}|#{player_b_lay}"
    raise "Incomplete odds" if player_a_win == 0 or player_b_win == 0 or player_a_lay == 0 or player_b_lay == 0
  end
end

class Market
  EXCHANGE_ID= 1

  def initialize id
    puts "Market #{id}"
    @bf = Betfair::API.new nil, false
    @helpers = Betfair::Helpers.new
    @id = id
    login
    find_market
  end

  def login
    username            = 'spencerward'
    password            = 'atheistb1'
    product_id          = 82
    vendor_software_id  = 0
    location_id         = 0
    ip_address          = nil
    @session_token = @bf.login username, password, product_id, vendor_software_id, location_id, ip_address
  end

  def odds
    Odds.new prices
  end

  def find_market
    locale          = nil 
    countries       = nil 
    from_date       = Time.now.utc
    to_date         = Time.now.utc
    @market = @bf.get_market @session_token, EXCHANGE_ID, @id, locale
    raise "Market is INVALID" if @market.to_s.starts_with? 'INVALID_MARKET'
    raise "Market is CLOSED" if @market[:market_status] == "CLOSED"
    puts "#{@market[:runners][:runner][0][:name]} vs #{@market[:runners][:runner][1][:name]}"
  end

  def prices
    currency_code = nil
    @prices = @bf.get_market_prices_compressed @session_token, EXCHANGE_ID, @id, currency_code
    @helpers.combine @market, @prices
  rescue
    puts @prices
    raise
  end
  
  def close
    @bf.logout @session_token
  end
end
