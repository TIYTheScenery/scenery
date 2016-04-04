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

ActiveRecord::Schema.define(version: 20160404201931) do

  create_table "performances", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.string   "trailer_link"
    t.string   "ticket_link"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "performances", ["company_id"], name: "index_performances_on_company_id"
  add_index "performances", ["owner_id"], name: "index_performances_on_owner_id"

  create_table "show_times", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "event_type"
    t.time     "begin_time"
    t.time     "end_time"
    t.integer  "venue_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "show_times", ["event_id"], name: "index_show_times_on_event_id"
  add_index "show_times", ["venue_id"], name: "index_show_times_on_venue_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.boolean  "professional"
    t.string   "display_name"
    t.string   "login_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["login_token"], name: "index_users_on_login_token"

end
