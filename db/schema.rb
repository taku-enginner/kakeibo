# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_11_17_110005) do
  create_table "receipt_categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.boolean "food_related"
    t.string "name"
    t.datetime "updated_at", null: false
    t.bigint "user_group_id", null: false
    t.index ["user_group_id"], name: "index_receipt_categories_on_user_group_id"
  end

  create_table "receipts", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "memo"
    t.bigint "price"
    t.bigint "receipt_category_id", null: false
    t.date "regist_date"
    t.datetime "updated_at", null: false
    t.bigint "user_group_id"
    t.integer "user_id", null: false
    t.index ["receipt_category_id"], name: "index_receipts_on_receipt_category_id"
    t.index ["user_group_id"], name: "index_receipts_on_user_group_id"
  end

  create_table "user_groups", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.bigint "user_group_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_group_id"], name: "index_users_on_user_group_id"
  end

  add_foreign_key "receipt_categories", "user_groups"
  add_foreign_key "receipts", "receipt_categories"
  add_foreign_key "receipts", "user_groups"
  add_foreign_key "users", "user_groups"
end
