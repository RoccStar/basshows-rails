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

ActiveRecord::Schema.define(version: 20150413204022) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bands", ["name"], name: "index_bands_on_name", unique: true, using: :btree

  create_table "favorite_bands", force: :cascade do |t|
    t.boolean  "favorite",   null: false
    t.integer  "user_id",    null: false
    t.integer  "band_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "favorite_venues", force: :cascade do |t|
    t.boolean  "favorite",   null: false
    t.integer  "user_id",    null: false
    t.integer  "venue_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "body",       null: false
    t.integer  "user_id",    null: false
    t.integer  "band_id"
    t.integer  "venue_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rating",     null: false
  end

  create_table "show_votes", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "show_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "value",      default: 0, null: false
  end

  create_table "shows", force: :cascade do |t|
    t.string   "date",       null: false
    t.string   "time",       null: false
    t.text     "ticket_url"
    t.text     "image_url"
    t.string   "avg_price"
    t.integer  "band_id",    null: false
    t.integer  "venue_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "venues", ["name"], name: "index_venues_on_name", unique: true, using: :btree

end
