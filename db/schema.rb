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

ActiveRecord::Schema.define(version: 20160415121617) do

  create_table "bases", force: :cascade do |t|
    t.integer  "harbour_id"
    t.text     "placement"
    t.string   "ip"
    t.datetime "last_seen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bases", ["harbour_id"], name: "index_bases_on_harbour_id"

  create_table "data_logs", force: :cascade do |t|
    t.integer  "device_id"
    t.boolean  "status"
    t.integer  "battery"
    t.datetime "station_timestamp"
    t.integer  "station_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "devices", force: :cascade do |t|
    t.integer  "slip_id"
    t.boolean  "active"
    t.string   "device_number"
    t.string   "mac_address"
    t.datetime "last_seen"
    t.datetime "install_date"
    t.string   "software_version"
    t.string   "hardware_version"
    t.boolean  "current_status"
    t.datetime "killed_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "devices", ["slip_id"], name: "index_devices_on_slip_id"

  create_table "harbours", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "zip"
    t.string   "city"
    t.string   "country",     default: "DK"
    t.integer  "phone"
    t.text     "description"
    t.boolean  "active",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "logs", force: :cascade do |t|
    t.integer  "device_id"
    t.boolean  "status"
    t.integer  "battery"
    t.datetime "station_timestamp"
    t.integer  "station_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "piers", force: :cascade do |t|
    t.integer  "harbour_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "piers", ["harbour_id"], name: "index_piers_on_harbour_id"

  create_table "slips", force: :cascade do |t|
    t.string   "slip_number"
    t.integer  "pier_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "slips", ["pier_id"], name: "index_slips_on_pier_id"

  create_table "stations", force: :cascade do |t|
    t.integer  "harbour_id"
    t.text     "placement"
    t.string   "ip"
    t.datetime "last_seen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "user_type"
    t.string   "email"
    t.string   "password"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
