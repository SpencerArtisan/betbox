require 'betfair'
require 'ostruct'

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
    results = prices
    puts "#{results[0][:b3]}|#{results[0][:b2]}|#{results[0][:b1]}||#{results[0][:l1]}|#{results[0][:l2]}|#{results[0][:l3]}"
    puts "#{results[1][:b3]}|#{results[1][:b2]}|#{results[1][:b1]}||#{results[1][:l1]}|#{results[1][:l2]}|#{results[1][:l3]}"
    OpenStruct.new player_a_win: results[0][:b1], player_b_win: results[1][:b1], player_a_lay: results[0][:l1], player_b_lay: results[1][:l1]
  end

  def find_market
    locale          = nil 
    countries       = nil 
    from_date       = Time.now.utc
    to_date         = Time.now.utc
    @market = @bf.get_market @session_token, EXCHANGE_ID, @id, locale
    raise "Market #{@id} is CLOSED" if @market[:market_status] == "CLOSED"
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
end
