class Vendor
  attr_reader :name,
              :inventory,
              :check_stock,
              :stock

  def initialize(name)
    @name = name
    @inventory = Hash.new(0) #gets rid of nil, returns 0
  end

  def stock(key, new_value)
    @inventory[key] += new_value
  end

  def check_stock(item)
    if inventory[item].nil?
      0
    else
      @inventory[item]
    end
  end

end
