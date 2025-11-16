class CreateReceipts < ActiveRecord::Migration[8.1]
  def change
    create_table :receipts do |t|
      t.references :receipt_category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.bigint :price
      t.text :memo
      t.date :regist_date

      t.timestamps
    end
  end
end
