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

ActiveRecord::Schema.define(version: 2019_02_10_050638) do

  create_table "infos", force: :cascade do |t|
    t.string "page"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.string "title"
    t.string "length"
    t.string "link"
    t.string "contact"
    t.text "description"
    t.boolean "reuse", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.boolean "approved", default: false
    t.string "password"
    t.boolean "archive", default: false
    t.string "status", default: "Being Reviewed"
    t.string "month", default: "None"
    t.string "reason", default: "None"
    t.string "preferred_month", default: "None"
    t.boolean "has_rights", default: false
    t.string "winning_month"
    t.string "winning_place"
    t.string "best_of_month"
    t.string "best_of_award"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "sumbissions", force: :cascade do |t|
    t.string "title"
    t.string "length"
    t.string "link"
    t.string "contact"
    t.text "description"
    t.boolean "reuse", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin"
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
  end

end
