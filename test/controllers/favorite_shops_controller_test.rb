require "test_helper"

class FavoriteShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_shop = favorite_shops(:one)
  end

  test "should get index" do
    get favorite_shops_url
    assert_response :success
  end

  test "should get new" do
    get new_favorite_shop_url
    assert_response :success
  end

  test "should create favorite_shop" do
    assert_difference("FavoriteShop.count") do
      post favorite_shops_url, params: { favorite_shop: {  } }
    end

    assert_redirected_to favorite_shop_url(FavoriteShop.last)
  end

  test "should show favorite_shop" do
    get favorite_shop_url(@favorite_shop)
    assert_response :success
  end

  test "should get edit" do
    get edit_favorite_shop_url(@favorite_shop)
    assert_response :success
  end

  test "should update favorite_shop" do
    patch favorite_shop_url(@favorite_shop), params: { favorite_shop: {  } }
    assert_redirected_to favorite_shop_url(@favorite_shop)
  end

  test "should destroy favorite_shop" do
    assert_difference("FavoriteShop.count", -1) do
      delete favorite_shop_url(@favorite_shop)
    end

    assert_redirected_to favorite_shops_url
  end
end
