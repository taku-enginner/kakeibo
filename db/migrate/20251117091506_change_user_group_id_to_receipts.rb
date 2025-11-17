class ChangeUserGroupIdToReceipts < ActiveRecord::Migration[8.1]
  def change
    change_column :receipts, :user_group_id, :bigint, null: true
    change_column :receipts, :user_id, :integer, null: false
  end
end
