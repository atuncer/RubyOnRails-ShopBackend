shops_controller_test.rbrequire 'test_helper'

class ShopsControllerTestForOtherOwner < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do

    @shop = shops(:one)
    @other_shop_owner = users(:three)
  end

  # OTHER SHOP OWNER
  test 'should get index as OTHER SHOP OWNER' do
    sign_in @other_shop_owner
    get shops_url
    assert_response :success
  end

  test 'should NOT get new as OTHER SHOP OWNER' do
    sign_in @other_shop_owner
    get new_shop_url
    assert_redirected_to shops_url
  end

  test 'should NOT create shop as OTHER SHOP OWNER' do
    sign_in @other_shop_owner
    assert_no_difference('Shop.count') do
      post shops_url, params: { shop: { 'name' => 'Test Name', 'bio' => 'Test Bio' } }
    end

    assert_redirected_to shops_url
  end

  test 'should show shop as OTHER SHOP OWNER' do
    sign_in @other_shop_owner
    get shop_url(@shop)
    assert_response :success
  end

  test 'should NOT get edit as OTHER SHOP OWNER' do
    sign_in @other_shop_owner
    get edit_shop_url(@shop)
    assert_redirected_to shops_url
  end

  test 'should NOT update shop as OTHER SHOP OWNER' do
    sign_in @other_shop_owner
    assert_no_changes -> { @shop.reload.name }, -> { @shop.reload.bio } do
      patch shop_url(@shop), params: { shop: { 'name' => 'Updated Name', 'bio' => 'Updated Bio' } }
    end
    assert_redirected_to shops_url
  end

  test 'should NOT destroy shop as OTHER SHOP OWNER' do
    sign_in @other_shop_owner
    assert_no_difference('Shop.count') do
      delete shop_url(@shop)
    end

    assert_redirected_to shops_url
  end
end
