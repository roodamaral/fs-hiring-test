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

ActiveRecord::Schema.define(version: 20180126223148) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "motel_id"
    t.integer  "room_id"
    t.integer  "amount_centavos"
    t.float    "fee_percentage"
    t.string   "booking_period"
    t.datetime "paid_at"
    t.string   "booking_code"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "bookings", ["motel_id"], name: "index_bookings_on_motel_id"
  add_index "bookings", ["room_id"], name: "index_bookings_on_room_id"

  create_table "motels", force: :cascade do |t|
    t.string   "name"
    t.string   "logo"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "motels", ["user_id"], name: "index_motels_on_user_id"

  create_table "rooms", force: :cascade do |t|
    t.integer  "motel_id"
    t.string   "name"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rooms", ["motel_id"], name: "index_rooms_on_motel_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
