class AddUserGroupIdToReceiptCategories < ActiveRecord::Migration[8.1]
  def change
    add_column :receipt_categories, :user_group_id, :integer
  end
end
