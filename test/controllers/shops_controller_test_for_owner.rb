require 'test_helper'

class ShopsControllerTestForPlainUser < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do

    @shop = shops(:one)
    @shop_owner = users(:two)
  end

  # SHOP OWNER
  test 'should get index as SHOP OWNER' do
    sign_in @shop_owner
    get shops_url
    assert_response :success
  end

  test 'should NOT get new as SHOP OWNER' do
    sign_in @shop_owner
    get new_shop_url
    assert_redirected_to shops_url
  end

  test 'should NOT create shop as SHOP OWNER' do
    sign_in @shop_owner
    assert_no_difference('Shop.count') do
      post shops_url, params: { shop: { 'name' => 'Test Name', 'bio' => 'Test Bio' } }
    end

    assert_redirected_to shops_url
  end

  test 'should show shop as SHOP OWNER' do
    sign_in @shop_owner
    get shop_url(@shop)
    assert_response :success
  end

  test 'should get edit as SHOP OWNER' do
    sign_in @shop_owner
    get edit_shop_url(@shop)
    assert_response :success
  end

  test 'should update shop as SHOP OWNER' do
    sign_in @shop_owner
    assert_changes -> { @shop.reload.name }, -> { @shop.reload.bio } do
      patch shop_url(@shop), params: { shop: { 'name' => 'Updated Name', 'bio' => 'Updated Bio' } }
    end
    assert_redirected_to shop_url(@shop)
  end

  test 'should destroy shop as SHOP OWNER' do
    sign_in @shop_owner
    assert_difference('Shop.count', -1) do
      delete shop_url(@shop)
    end

    assert_redirected_to shops_url
  end
end
