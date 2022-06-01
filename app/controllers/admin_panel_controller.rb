class AdminPanelController < ApplicationController

  helper_method :get_waiting_approval
  def get_waiting_approval()
    Shop.all.where(isWaitingApproval: true)
  end

end
