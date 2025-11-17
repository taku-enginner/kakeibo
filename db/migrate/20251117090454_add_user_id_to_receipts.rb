class AddUserIdToReceipts < ActiveRecord::Migration[8.1]
  def change
    add_column :receipts, :user_id, :integer
  end
end
