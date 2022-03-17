require "test_helper"

class FavoriteItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_item = favorite_items(:one)
  end

  test "should get index" do
    get favorite_items_url
    assert_response :success
  end

  test "should get new" do
    get new_favorite_item_url
    assert_response :success
  end

  test "should create favorite_item" do
    assert_difference("FavoriteItem.count") do
      post favorite_items_url, params: { favorite_item: {  } }
    end

    assert_redirected_to favorite_item_url(FavoriteItem.last)
  end

  test "should show favorite_item" do
    get favorite_item_url(@favorite_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_favorite_item_url(@favorite_item)
    assert_response :success
  end

  test "should update favorite_item" do
    patch favorite_item_url(@favorite_item), params: { favorite_item: {  } }
    assert_redirected_to favorite_item_url(@favorite_item)
  end

  test "should destroy favorite_item" do
    assert_difference("FavoriteItem.count", -1) do
      delete favorite_item_url(@favorite_item)
    end

    assert_redirected_to favorite_items_url
  end
end
