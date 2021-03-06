require 'minitest/autorun'
require 'minitest/pride'
require './lib/market'
require './lib/vendor'
require 'pry'

class MarketTest < Minitest::Test
  def test_it_exists
    @market = Market.new("South Pearl Street Farmers Market")

  end

  def setup
    @market = Market.new("South Pearl Street Farmers Market")
    @vendor_1 = Vendor.new("Rocky Mountain Fresh")
    @vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor_3 = Vendor.new("Palisade Peach Shack")
  end

  def test_vendors_returns_empty_array
    assert_equal [], @market.vendors
  end

  def test_add_vendor_objects_to_array
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)
    expected = [@vendor_1, @vendor_2, @vendor_3]
    assert_equal expected, @market.vendors
  end

  def test_vendor_names
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)
    expected = ["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"]

    assert_equal expected, @market.vendor_names
  end

  def test_vendors_that_sell_method
    @vendor_1 = Vendor.new("Rocky Mountain Fresh")
    @vendor_2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor_3 = Vendor.new("Palisade Peach Shack")
    @market.add_vendor(@vendor_1)
    @market.add_vendor(@vendor_2)
    @market.add_vendor(@vendor_3)
    @vendor_1.stock("Peaches", 35)
    @vendor_1.stock("Tomatoes", 7)
    @vendor_2.stock("Banana Nice Cream", 50)
    @vendor_2.stock("Peach-Raspberry Nice Cream", 25)
    @vendor_3.stock("Peaches", 65)
    expected = [@vendor_1, @vendor_3]

    assert_equal expected, @market.vendors_that_sell("Peaches")

    expected = [@vendor_2]
    assert_equal expected, @market.vendors_that_sell("Banana Nice Cream")
  end

    def test_sorted_item_list
      @vendor_1 = Vendor.new("Rocky Mountain Fresh")
      @vendor_2 = Vendor.new("Ba-Nom-a-Nom")
      @vendor_3 = Vendor.new("Palisade Peach Shack")
      @market.add_vendor(@vendor_1)
      @market.add_vendor(@vendor_2)
      @market.add_vendor(@vendor_3)
      @vendor_1.stock("Peaches", 35)
      @vendor_1.stock("Tomatoes", 7)
      @vendor_2.stock("Banana Nice Cream", 50)
      @vendor_2.stock("Peach-Raspberry Nice Cream", 25)
      @vendor_3.stock("Peaches", 65)

      expected = ["Banana Nice Cream", "Peach-Raspberry Nice Cream", "Peaches", "Tomatoes"]

      assert_equal expected, @market.sorted_item_list
    end



end
