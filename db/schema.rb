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

ActiveRecord::Schema.define(version: 2019_12_03_111812) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.string "identifier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.string "icon"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "iso_code", default: ""
  end

  create_table "meetups", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.integer "duration"
    t.string "location"
    t.boolean "confirmed", default: false
    t.text "greeting", default: "Hi, looking forward to meeting you!"
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "longitude"
    t.float "latitude"
    t.bigint "sharing_lang_id"
    t.bigint "seeking_lang_id"
    t.index ["recipient_id"], name: "index_meetups_on_recipient_id"
    t.index ["seeking_lang_id"], name: "index_meetups_on_seeking_lang_id"
    t.index ["sender_id"], name: "index_meetups_on_sender_id"
    t.index ["sharing_lang_id"], name: "index_meetups_on_sharing_lang_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.integer "user_id"
    t.integer "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.string "main_quality"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "author_id"
    t.bigint "user_id"
    t.index ["author_id"], name: "index_reviews_on_author_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "chat_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_languages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "language_id"
    t.integer "proficiency"
    t.boolean "seeking"
    t.boolean "sharing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_user_languages_on_language_id"
    t.index ["user_id"], name: "index_user_languages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "city"
    t.text "bio"
    t.string "photo"
    t.integer "num_of_past_meetups"
    t.integer "pending_event_confirmation"
    t.string "availibility"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vocab_items", force: :cascade do |t|
    t.string "content"
    t.bigint "vocab_list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vocab_list_id"], name: "index_vocab_items_on_vocab_list_id"
  end

  create_table "vocab_lists", force: :cascade do |t|
    t.bigint "language_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_vocab_lists_on_language_id"
    t.index ["user_id"], name: "index_vocab_lists_on_user_id"
  end

  add_foreign_key "meetups", "languages", column: "seeking_lang_id"
  add_foreign_key "meetups", "languages", column: "sharing_lang_id"
  add_foreign_key "reviews", "users"
  add_foreign_key "reviews", "users", column: "author_id"
  add_foreign_key "user_languages", "languages"
  add_foreign_key "user_languages", "users"

  add_foreign_key "vocab_items", "vocab_lists"
  add_foreign_key "vocab_lists", "languages"
  add_foreign_key "vocab_lists", "users"
end
