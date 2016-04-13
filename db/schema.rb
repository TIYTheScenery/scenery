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

ActiveRecord::Schema.define(version: 20160413170538) do

  create_table "cast_members", force: :cascade do |t|
    t.string   "name"
    t.string   "role"
    t.integer  "show_time_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "cast_members", ["show_time_id"], name: "index_cast_members_on_show_time_id"

  create_table "companies", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.string   "website_link"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "instagram_link"
    t.string   "youtube_link"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
    t.string   "hero_image_file_name"
    t.string   "hero_image_content_type"
    t.integer  "hero_image_file_size"
    t.datetime "hero_image_updated_at"
    t.string   "profile_image_url"
    t.string   "hero_image_url"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "company_users", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "company_users", ["company_id"], name: "index_company_users_on_company_id"
  add_index "company_users", ["user_id"], name: "index_company_users_on_user_id"

  create_table "genre_lessons", force: :cascade do |t|
    t.integer  "genre_id"
    t.integer  "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "genre_lessons", ["genre_id"], name: "index_genre_lessons_on_genre_id"
  add_index "genre_lessons", ["lesson_id"], name: "index_genre_lessons_on_lesson_id"

  create_table "genre_performances", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "genre_id"
    t.integer  "performance_id"
  end

  add_index "genre_performances", ["genre_id"], name: "index_genre_performances_on_genre_id"
  add_index "genre_performances", ["performance_id"], name: "index_genre_performances_on_performance_id"

  create_table "genres", force: :cascade do |t|
    t.string   "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.integer  "number_of_seats"
    t.string   "ticket_link"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "owner_id"
  end

  add_index "lessons", ["company_id"], name: "index_lessons_on_company_id"

  create_table "opportunities", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "venue_id"
    t.string   "name"
    t.text     "description"
    t.string   "contact_info"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "opportunities", ["company_id"], name: "index_opportunities_on_company_id"
  add_index "opportunities", ["venue_id"], name: "index_opportunities_on_venue_id"

  create_table "performances", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.string   "trailer_link"
    t.string   "ticket_link"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "hero_image_file_name"
    t.string   "hero_image_content_type"
    t.integer  "hero_image_file_size"
    t.datetime "hero_image_updated_at"
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
    t.string   "production_image_file_name"
    t.string   "production_image_content_type"
    t.integer  "production_image_file_size"
    t.datetime "production_image_updated_at"
    t.string   "production_image_url"
    t.string   "profile_image_url"
    t.string   "hero_image_url"
  end

  add_index "performances", ["company_id"], name: "index_performances_on_company_id"
  add_index "performances", ["owner_id"], name: "index_performances_on_owner_id"

  create_table "reviews", force: :cascade do |t|
    t.text     "opinion"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "reviewee_id"
    t.string   "reviewee_type"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "display_name"
  end

  add_index "reviews", ["reviewee_id"], name: "index_reviews_on_reviewee_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "show_date"
  end

  add_index "show_times", ["event_id"], name: "index_show_times_on_event_id"
  add_index "show_times", ["venue_id"], name: "index_show_times_on_venue_id"

  create_table "titles", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_titles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "title_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_titles", ["title_id"], name: "index_user_titles_on_title_id"
  add_index "user_titles", ["user_id"], name: "index_user_titles_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.boolean  "is_professional"
    t.string   "display_name"
    t.string   "login_token"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "instagram_link"
    t.string   "youtube_link"
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
    t.string   "image_url"
  end

  add_index "users", ["login_token"], name: "index_users_on_login_token"

end
