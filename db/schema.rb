# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140821130427) do

  create_table "member_order_ables", force: true do |t|
    t.integer  "user_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "member_order_ables", ["order_id"], name: "index_member_order_ables_on_order_id", using: :btree
  add_index "member_order_ables", ["user_id"], name: "index_member_order_ables_on_user_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "source_url",               null: false
    t.datetime "finish_time",              null: false
    t.integer  "is_success",  default: 0
    t.string   "error_msg",   default: ""
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "shop_id"
  end

  add_index "orders", ["shop_id"], name: "index_orders_on_shop_id", using: :btree
  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "product_items", force: true do |t|
    t.string   "image_url"
    t.string   "name"
    t.integer  "shop_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_items", ["shop_id"], name: "index_product_items_on_shop_id", using: :btree

  create_table "shops", force: true do |t|
    t.string   "source_url"
    t.string   "name"
    t.string   "address"
    t.string   "tel"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "shops", ["order_id"], name: "index_shops_on_order_id", using: :btree

  create_table "user_item_ables", force: true do |t|
    t.integer  "count",           default: 0
    t.integer  "user_id"
    t.integer  "product_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
  end

  add_index "user_item_ables", ["order_id"], name: "index_user_item_ables_on_order_id", using: :btree
  add_index "user_item_ables", ["product_item_id"], name: "index_user_item_ables_on_product_item_id", using: :btree
  add_index "user_item_ables", ["user_id"], name: "index_user_item_ables_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "username",               default: "", null: false
    t.string   "phone_number",           default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["phone_number"], name: "index_users_on_phone_number", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
