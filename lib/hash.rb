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


