require 'betfair'

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

  def find_market
    locale          = nil 
    countries       = nil 
    from_date       = Time.now.utc
    to_date         = Time.now.utc
    @market = @bf.get_market @session_token, EXCHANGE_ID, @id, locale
    raise "Market is INVALID" if @market.to_s.starts_with? 'INVALID_MARKET'
    puts @market.to_s
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
