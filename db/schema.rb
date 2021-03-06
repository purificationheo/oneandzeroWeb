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

ActiveRecord::Schema.define(version: 20160911084558) do

  create_table "ahoy_events", force: :cascade do |t|
    t.integer  "visit_id"
    t.integer  "user_id"
    t.string   "name"
    t.text     "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["user_id", "name"], name: "index_ahoy_events_on_user_id_and_name"
    t.index ["visit_id", "name"], name: "index_ahoy_events_on_visit_id_and_name"
  end

  create_table "attachments", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "timeline_id"
    t.integer  "borrowablestuff_id"
    t.integer  "member_id"
    t.integer  "project_id"
    t.string   "image_url"
    t.string   "file"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "boards", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "borrowablestuffs", force: :cascade do |t|
    t.string   "stufftype"
    t.string   "stuffstrcode"
    t.integer  "stuffintcode"
    t.string   "stuffcode"
    t.text     "description"
    t.string   "image_url"
    t.integer  "max_lendingperiod",      default: 14,    null: false
    t.integer  "lended_period"
    t.boolean  "is_borrowed",            default: false
    t.datetime "lended_at"
    t.integer  "lastest_lended_user_id"
    t.integer  "current_lended_user_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["current_lended_user_id"], name: "index_borrowablestuffs_on_current_lended_user_id"
    t.index ["lastest_lended_user_id"], name: "index_borrowablestuffs_on_lastest_lended_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.string   "occupation"
    t.string   "email"
    t.string   "facebook_url"
    t.string   "gisu"
    t.string   "entry_semester"
    t.text     "description"
    t.integer  "user_id"
    t.boolean  "is_admin",       default: false
    t.boolean  "is_professor",   default: false
    t.boolean  "is_alumni",      default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "board_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.text     "short_description"
    t.text     "long_description"
    t.string   "image_url"
    t.string   "reference_url"
    t.boolean  "is_ongoing"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "timelines", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image_url"
    t.string   "image_caption"
    t.string   "content_title"
    t.text     "content_body"
    t.datetime "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "is_admin",               default: false
    t.boolean  "is_member",              default: false
    t.integer  "member_id"
    t.integer  "student_number"
    t.string   "name"
    t.string   "department_name"
    t.string   "entry_semester"
    t.string   "kakaotalkid"
    t.string   "profile_image_url"
    t.string   "gisu"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.string   "visit_token"
    t.string   "visitor_token"
    t.string   "ip"
    t.text     "user_agent"
    t.text     "referrer"
    t.text     "landing_page"
    t.integer  "user_id"
    t.string   "referring_domain"
    t.string   "search_keyword"
    t.string   "browser"
    t.string   "os"
    t.string   "device_type"
    t.integer  "screen_height"
    t.integer  "screen_width"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "postal_code"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "utm_source"
    t.string   "utm_medium"
    t.string   "utm_term"
    t.string   "utm_content"
    t.string   "utm_campaign"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_visits_on_user_id"
    t.index ["visit_token"], name: "index_visits_on_visit_token", unique: true
  end

end
