class Vendor
  attr_reader :name,
              :inventory,
              :check_stock,
              :stock

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(key, value)
    #take in a Key and value Arg
    #create a new hash with Key Value pair
    #if the next key value arg has the same key, add the sum of the values
  end

  def check_stock(key)
    @inventory.include?(key)
    if @inventory.values.empty? == true
      return 0
    else
      return @inventory.values
    end
  end

end
