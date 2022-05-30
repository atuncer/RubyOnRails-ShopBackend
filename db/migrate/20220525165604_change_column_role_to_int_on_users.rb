class ChangeColumnRoleToIntOnUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :integer, using: 'role::bool'
  end
end
