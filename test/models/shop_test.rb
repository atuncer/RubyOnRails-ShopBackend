require "test_helper"

class ShopTest < ActiveSupport::TestCase

  def setup
    @user_with_no_shop = User.find(1)
    @user_with_shop = User.find(3)
  end

  test "default constructed shop should not be valid" do
    @shop = Shop.new
    assert_not @shop.valid?
  end

  test "shop with no user_id should not be valid" do
    @shop = Shop.new(name: "Test Shop", bio: "Test Bio")
    #Rails::logger.debug @shop.errors.full_messages
    assert_not @shop.valid?
  end

  test "shop with no name should not be valid" do
    @shop = Shop.new(user_id: @user_with_no_shop.id, bio: "Test Bio")
    assert_not @shop.valid?
  end

  test "shop with no bio should not be valid" do
    @shop = Shop.new(user_id: @user_with_no_shop.id, name: "Test Shop")
    assert_not @shop.valid?
  end

  test "shop created by another shop owner should not be valid" do
    @shop = Shop.new(user_id: @user_with_shop.id, name: "Test Shop", bio: "Test Bio")
    assert_not @shop.valid?
  end

  test "shop with all required fields should be valid" do
    @shop = Shop.new(user_id: @user_with_no_shop.id, name: "Test Shop", bio: "Test Bio")
    assert @shop.valid?
  end

end
