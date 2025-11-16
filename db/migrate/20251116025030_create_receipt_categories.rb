class CreateReceiptCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :receipt_categories do |t|
      t.string :name
      t.text :description
      t.boolean :food_related

      t.timestamps
    end
  end
end
