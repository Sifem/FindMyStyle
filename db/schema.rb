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

ActiveRecord::Schema[7.1].define(version: 2024_04_15_110958) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "recommendations", force: :cascade do |t|
    t.text "description"
    t.string "body_part"
    t.string "function"
    t.string "item"
    t.bigint "silhouette_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["silhouette_id"], name: "index_recommendations_on_silhouette_id"
  end

  create_table "silhouettes", force: :cascade do |t|
    t.string "neutral_silhouette"
    t.string "combined_silhouette"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "category"
  end

  create_table "user_silhouettes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "silhouette_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["silhouette_id"], name: "index_user_silhouettes_on_silhouette_id"
    t.index ["user_id"], name: "index_user_silhouettes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.boolean "payment", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "recommendations", "silhouettes"
  add_foreign_key "user_silhouettes", "silhouettes"
  add_foreign_key "user_silhouettes", "users"
end
