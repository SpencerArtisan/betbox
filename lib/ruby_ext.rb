require 'csv'
require 'hash'

class Hash
  def flat_hash k=[]
    new_hash = {}
    each_pair do |key, val|
      if val.is_a?(Hash)
        new_hash.merge!(val.flat_hash(k + [key]))
      else
        new_hash[k + [key]] = val
      end
    end
    new_hash
  end
end

class CSV
  def add_hash_row hash
    hash = hash.flat_hash
    if @lineno == 0
      headers = hash.keys.map {|column_names| column_names.join '/'}
      self << headers
    end
    self << hash.values
  end
end
