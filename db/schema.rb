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

ActiveRecord::Schema.define(version: 20140131012714) do

  create_table "cities", force: true do |t|
    t.string   "name",       default: "", null: false
    t.integer  "state_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["state_id"], name: "index_cities_on_state_id", using: :btree

  create_table "menu_categories", force: true do |t|
    t.string   "name",          default: "", null: false
    t.text     "description"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "menu_categories", ["restaurant_id"], name: "index_menu_categories_on_restaurant_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name",               default: "", null: false
    t.text     "description"
    t.string   "slug",               default: "", null: false
    t.string   "logo"
    t.string   "website"
    t.string   "zip_code",           default: "", null: false
    t.string   "street",             default: "", null: false
    t.string   "street_number",      default: "", null: false
    t.string   "neighborhood",       default: "", null: false
    t.string   "phone_number"
    t.string   "extra_phone_number"
    t.string   "complement"
    t.float    "latitute"
    t.float    "longitude"
    t.boolean  "gmaps"
    t.integer  "city_id",                         null: false
    t.integer  "user_id",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurants", ["city_id"], name: "index_restaurants_on_city_id", using: :btree
  add_index "restaurants", ["slug"], name: "index_restaurants_on_slug", unique: true, using: :btree
  add_index "restaurants", ["user_id"], name: "index_restaurants_on_user_id", using: :btree

  create_table "states", force: true do |t|
    t.string   "name",       default: "", null: false
    t.string   "acronym",    default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
