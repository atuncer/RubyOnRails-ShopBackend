require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    # @user_with_no_shop = User.find(1)
    # @user_with_shop = User.find(3)
    user_ids = User.all.collect(&:id)
    shop_owner_ids = Shop.all.collect(&:user_id)
    non_shop_owner_ids = user_ids - shop_owner_ids
    @user_with_no_shop = User.find(non_shop_owner_ids.first)
    @user_with_shop = User.find(shop_owner_ids.first)
  end

  # Devise is

  # test "the truth" do
  #   assert true
  # end
end
