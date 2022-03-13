require 'test_helper'

class ShopsControllerTestForPlainUser < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do

    @shop = shops(:one)
    @plain_user = users(:four)
  end

  # PLAIN USER (that has no access creating a new shop)
  test 'should get index as PLAIN USER' do
    sign_in @plain_user
    get shops_url
    assert_response :success
  end

  test 'should NOT get new as PLAIN USER' do
    sign_in @plain_user
    get new_shop_url
    assert_redirected_to shops_url
  end

  test 'should NOT create shop as PLAIN USER' do
    sign_in @plain_user
    assert_no_difference('Shop.count') do
      post shops_url, params: { shop: { 'name' => 'Test Name', 'bio' => 'Test Bio' } }
    end

    assert_redirected_to shops_url
  end

  test 'should show shop as PLAIN USER' do
    sign_in @plain_user
    get shop_url(@shop)
    assert_response :success
  end

  test 'should NOT get edit as PLAIN USER' do
    sign_in @plain_user
    get edit_shop_url(@shop)
    assert_redirected_to shops_url
  end

  test 'should NOT update shop as PLAIN USER' do
    sign_in @plain_user
    assert_no_changes -> { @shop.reload.name }, -> { @shop.reload.bio } do
      patch shop_url(@shop), params: { shop: { 'name' => 'Updated Name', 'bio' => 'Updated Bio' } }
    end
    assert_redirected_to shops_url
  end

  test 'should NOT destroy shop as PLAIN USER' do
    sign_in @plain_user
    assert_no_difference('Shop.count') do
      delete shop_url(@shop)
    end

    assert_redirected_to shops_url
  end
end
