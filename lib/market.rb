require 'betfair'

class Market
  EXCHANGE_ID= 1

  def initialize id
    @bf = Betfair::API.new
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
    find_market
    results = prices
    {player_a_win: results[0][:b1],
     player_b_win: results[1][:b1]}
  end

  def find_market
    locale          = nil 
    countries       = nil 
    from_date       = Time.now.utc
    to_date         = Time.now.utc
    @market = @bf.get_market @session_token, EXCHANGE_ID, @id, locale
  end

  def prices
    currency_code = nil
    prices = @bf.get_market_prices_compressed @session_token, EXCHANGE_ID, @id, currency_code
    @helpers.combine @market, prices
  end
end
