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

ActiveRecord::Schema.define(version: 20150914152014) do

  create_table "contests", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.date     "startdate"
    t.date     "enddate"
    t.binary   "binary_data"
    t.string   "content_type"
    t.string   "description"
    t.string   "filename"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contests", ["user_id", "created_at"], name: "index_contests_on_user_id_and_created_at"
  add_index "contests", ["user_id"], name: "index_contests_on_user_id"

  create_table "photos", force: true do |t|
    t.string   "description"
    t.string   "content_type"
    t.string   "filename"
    t.binary   "binary_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  create_table "videos", force: true do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.string   "message"
    t.boolean  "converted",          default: false
    t.integer  "contest_id"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "videos", ["contest_id"], name: "index_videos_on_contest_id"

end
