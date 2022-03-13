require 'test_helper'

class ShopsControllerTestForNonOwner < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do

    @shop = shops(:one)
    @non_shop_owner = users(:one)
  end

  # NON SHOP OWNER (has access to creating a new shop)
  test 'should get index as NON SHOP OWNER' do
    sign_in @non_shop_owner
    get shops_url
    assert_response :success
  end

  test 'should get new as NON SHOP OWNER' do
    sign_in @non_shop_owner
    get new_shop_url
    assert_response :success
  end

  test 'should create shop as NON SHOP OWNER' do
    sign_in @non_shop_owner
    assert_difference('Shop.count') do
      post shops_url, params: { shop: { 'name' => 'Test Name', 'bio' => 'Test Bio' } }
    end

    assert_redirected_to shop_url(Shop.last)
  end

  test 'should show shop as NON SHOP OWNER' do
    sign_in @non_shop_owner
    get shop_url(@shop)
    assert_response :success
  end

  test 'should NOT get edit as NON SHOP OWNER' do
    sign_in @non_shop_owner
    get edit_shop_url(@shop)
    assert_redirected_to shops_url
  end

  test 'should NOT update shop as NON SHOP OWNER' do
    sign_in @non_shop_owner

    assert_no_changes -> { @shop.reload.name }, -> { @shop.reload.bio } do
      patch shop_url(@shop), params: { shop: { 'name' => 'Updated Name', 'bio' => 'Updated Bio' } }
    end
    assert_redirected_to shops_url
  end

  test 'should NOT destroy shop as NON SHOP OWNER' do
    sign_in @non_shop_owner
    assert_no_difference('Shop.count') do
      delete shop_url(@shop)
    end

    assert_redirected_to shops_url
  end
end
