require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'
require 'pry'

class VendorTest < Minitest::Test
  def test_it_exists
    @vendor = Vendor.new("Rocky Mountain Fresh")
    assert_instance_of Vendor, @vendor
  end

  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_has_a_name
    @vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal "Rocky Mountain Fresh", @vendor.name
  end

  def test_inventory_starts_as_empty_hash
    @vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal ({}), @vendor.inventory
  end

  def test_check_stock
    @vendor = Vendor.new("Rocky Mountain Fresh")
    assert_equal 0, @vendor.check_stock("Peaches")
    end


  def test_stock_adds_item
    @vendor = Vendor.new("Rocky Mountain Fresh")
    @vendor.stock("Peaches", 30)
    assert_equal [30], @vendor.check_stock("Peaches")
    @vendor.stock("Peaches", 25)
    assert_equal [55], @vendor.check_stock("Peaches")
  end



end
