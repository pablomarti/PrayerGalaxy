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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111231041550) do

  create_table "abouts", :force => true do |t|
    t.text     "description"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_levels", :force => true do |t|
    t.string   "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admins", :force => true do |t|
    t.integer  "admin_level_id"
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.boolean  "active",         :default => true
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_pages", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone",      :limit => 15
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.string   "about"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "donations", :force => true do |t|
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partners", :force => true do |t|
    t.string   "image"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prayer_watches", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",       :precision => 10, :scale => 2
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "lastname"
    t.string   "email"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_hash"
    t.string   "password_salt"
  end

  create_table "videos", :force => true do |t|
    t.string   "title"
    t.string   "video"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic1"
    t.string   "pic2"
    t.string   "pic3"
  end

  create_table "visions", :force => true do |t|
    t.text     "description"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
    t.string   "video"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
