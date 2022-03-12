require 'test_helper'

class ShopTest < ActiveSupport::TestCase

  def setup
    # @user_with_no_shop = User.find(1)
    # @user_with_shop = User.find(3)
    user_ids = User.all.collect(&:id)
    shop_owner_ids = Shop.all.collect(&:user_id)
    non_shop_owner_ids = user_ids - shop_owner_ids
    @user_with_no_shop = User.find(non_shop_owner_ids.first)
    @user_with_shop = User.find(shop_owner_ids.first)
  end

  # Construction tests
  test 'default constructed shop should not be valid' do
    @shop = Shop.new
    assert_not @shop.valid?
  end

  test 'shop with no user_id should not be valid' do
    @shop = Shop.new(name: 'Test Shop', bio: 'Test Bio')
    assert_not @shop.valid?
  end

  test 'shop with no name should not be valid' do
    @shop = Shop.new(user_id: @user_with_no_shop.id, bio: 'Test Bio')
    assert_not @shop.valid?
  end

  test 'shop with no bio should not be valid' do
    @shop = Shop.new(user_id: @user_with_no_shop.id, name: 'Test Shop')
    assert_not @shop.valid?
  end

  test 'shop created by another shop owner should not be valid' do
    @shop = Shop.new(user_id: @user_with_no_shop.id, name: 'Test Shop', bio: 'Test Bio')
    assert_not @shop.valid?
  end

  test 'shop with all required fields should be valid' do
    @shop = Shop.new(user_id: @user_with_no_shop.id, name: 'Test Shop', bio: 'Test Bio')
    assert @shop.valid?
  end

  # Field change tests
  test 'shop can change bio' do
    @shop = Shop.new(user_id: @user_with_no_shop.id, name: 'Test Shop', bio: 'Test Bio')
    @shop.bio = 'New Bio'
    assert_equal 'New Bio', @shop.bio
  end

  test 'shop can change name' do
    @shop = Shop.new(user_id: @user_with_no_shop.id, name: 'Test Shop', bio: 'Test Bio')
    @shop.name = 'New Name'
    assert_equal 'New Name', @shop.name
  end

  test 'shop cannot be passed to an existing shop owner' do
    @shop = Shop.new(user_id: @user_with_no_shop.id, name: 'Test Shop', bio: 'Test Bio')
    @shop.user_id = @user_with_shop.id
    assert_not @shop.valid?
  end

  test 'shop can be passed to a non shop owner' do
    @shop = @user_with_shop.shop
    @shop.user_id = @user_with_no_shop.id
    assert_equal @user_with_no_shop.id, @shop.user_id
  end

  # Association tests
  test 'when shop owner object is destroyed, shop should be destroyed' do
    @shop = @user_with_shop.shop
    @user_with_shop.destroy
    assert_not Shop.exists?(@shop.id)
  end



end
