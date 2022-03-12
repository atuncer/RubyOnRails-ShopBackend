require "test_helper"

class ShopsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    # users(:two) owns shop(:one)
    @shop = shops(:one)
    @shop_owner = users(:two)
    @non_shop_owner = users(:one)
    @other_shop_owner = users(:three)
  end

  # SHOP OWNER
  test "should get index as SHOP OWNER" do
    sign_in @shop_owner
    get shops_url
    assert_response :success
  end

  test "should get new as SHOP OWNER" do
    sign_in @shop_owner
    get new_shop_url
    assert_response :success
  end

  test "should NOT create shop as SHOP OWNER" do
    sign_in @shop_owner
    old_shop_count = Shop.count
    post shops_url, params: { shop: { "name"=>"Test Name", "bio"=>"Test Bio" } }
    assert_equal old_shop_count, Shop.count

    assert_response :unprocessable_entity
  end

  test "should show shop as SHOP OWNER" do
    sign_in @shop_owner
    get shop_url(@shop)
    assert_response :success
  end

  test "should get edit as SHOP OWNER" do
    sign_in @shop_owner
    get edit_shop_url(@shop)
    assert_response :success
  end

  test "should update shop as SHOP OWNER" do
    sign_in @shop_owner
    patch shop_url(@shop), params: { shop: { "name"=>"Test Name", "bio"=>"Test Bio" } }
    assert_redirected_to shop_url(@shop)
  end

  test "should destroy shop as SHOP OWNER" do
    sign_in @shop_owner
    assert_difference("Shop.count", -1) do
      delete shop_url(@shop)
    end

    assert_redirected_to shops_url
  end
end
