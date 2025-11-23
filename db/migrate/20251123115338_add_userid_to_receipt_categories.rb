class AddUseridToReceiptCategories < ActiveRecord::Migration[8.1]
  def change
    add_column :receipt_categories, :user_id, :integer
  end
end
