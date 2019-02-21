class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    names = @vendors.map do |vendor|
      vendor.name
    end
    return names
  end

  def vendors_that_sell(item_arg)
    sellers = @vendors.find_all do |items_sold|
      items_sold.inventory.include?(item_arg)
    end
    sellers
  end

  def sorted_item_list
  list =  @vendors.map do |items_sold|
      for_sale = items_sold.inventory
        for_sale.keys
    end
    list.flatten.uniq.sort
  end


end
