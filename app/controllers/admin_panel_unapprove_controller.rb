class AdminPanelUnapproveController < ApplicationController

  helper_method :get_is_live
  def get_is_live
    Shop.all.where(isLive: true)
  end

end
