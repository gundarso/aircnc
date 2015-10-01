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

ActiveRecord::Schema.define(version: 20151001114512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.date     "year"
    t.integer  "mileage"
    t.string   "fuel"
    t.integer  "seats"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "pickup_address"
    t.integer  "category_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.decimal  "rate",                 precision: 7, scale: 2
  end

  add_index "cars", ["category_id"], name: "index_cars_on_category_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "owners", ["car_id"], name: "index_owners_on_car_id", using: :btree
  add_index "owners", ["user_id"], name: "index_owners_on_user_id", using: :btree

  create_table "renters", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "renters", ["user_id"], name: "index_renters_on_user_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.datetime "checkin"
    t.datetime "checkout"
    t.integer  "rating"
    t.integer  "renter_id"
    t.integer  "car_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "reservations", ["car_id"], name: "index_reservations_on_car_id", using: :btree
  add_index "reservations", ["renter_id"], name: "index_reservations_on_renter_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cars", "categories"
  add_foreign_key "owners", "cars"
  add_foreign_key "owners", "users"
  add_foreign_key "renters", "users"
  add_foreign_key "reservations", "cars"
  add_foreign_key "reservations", "renters"
end
