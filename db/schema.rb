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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20160404175902) do

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
=======
ActiveRecord::Schema.define(version: 20160404213801) do
>>>>>>> 946d61e9f28a5b0411ccefcc2d487130c994ad37

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.boolean  "is_professional"
    t.string   "display_name"
    t.string   "login_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["login_token"], name: "index_users_on_login_token"

end
