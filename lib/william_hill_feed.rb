require 'williamhill'

class WilliamHillFeed
  def data 
    data = WilliamHill.new("43").get_full_markets
    #puts "Feed data is #{data[0..50]}"
    data
  end
end
