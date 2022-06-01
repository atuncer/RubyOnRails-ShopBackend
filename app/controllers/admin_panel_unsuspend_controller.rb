class AdminPanelUnsuspendController < ApplicationController

  helper_method :get_is_not_live
  def get_is_not_live
    Shop.all.where(isLive: false)
  end

end
