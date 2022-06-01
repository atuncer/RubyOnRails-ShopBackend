class ChangeShopsColumnNameIsVisibleIsWaitingApproval < ActiveRecord::Migration[7.0]
  def change
    rename_column :shops, :isVisible, :isWaitingApproval
  end
end
