require "application_system_test_case"

class FavoriteItemsTest < ApplicationSystemTestCase
  setup do
    @favorite_item = favorite_items(:one)
  end

  test "visiting the index" do
    visit favorite_items_url
    assert_selector "h1", text: "Favorite items"
  end

  test "should create favorite item" do
    visit favorite_items_url
    click_on "New favorite item"

    click_on "Create Favorite item"

    assert_text "Favorite item was successfully created"
    click_on "Back"
  end

  test "should update Favorite item" do
    visit favorite_item_url(@favorite_item)
    click_on "Edit this favorite item", match: :first

    click_on "Update Favorite item"

    assert_text "Favorite item was successfully updated"
    click_on "Back"
  end

  test "should destroy Favorite item" do
    visit favorite_item_url(@favorite_item)
    click_on "Destroy this favorite item", match: :first

    assert_text "Favorite item was successfully destroyed"
  end
end
