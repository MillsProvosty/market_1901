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
    sellers = @vendors.group_by do |vendor_name, items_sold|
      items_sold.inventory == items_arg
    end
    sellers
  end

end
