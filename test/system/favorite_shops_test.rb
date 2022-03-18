require "application_system_test_case"

class FavoriteShopsTest < ApplicationSystemTestCase
  setup do
    @favorite_shop = favorite_shops(:one)
  end

  test "visiting the index" do
    visit favorite_shops_url
    assert_selector "h1", text: "Favorite shops"
  end

  test "should create favorite shop" do
    visit favorite_shops_url
    click_on "New favorite shop"

    click_on "Create Favorite shop"

    assert_text "Favorite shop was successfully created"
    click_on "Back"
  end

  test "should update Favorite shop" do
    visit favorite_shop_url(@favorite_shop)
    click_on "Edit this favorite shop", match: :first

    click_on "Update Favorite shop"

    assert_text "Favorite shop was successfully updated"
    click_on "Back"
  end

  test "should destroy Favorite shop" do
    visit favorite_shop_url(@favorite_shop)
    click_on "Destroy this favorite shop", match: :first

    assert_text "Favorite shop was successfully destroyed"
  end
end
