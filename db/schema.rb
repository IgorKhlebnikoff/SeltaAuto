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

ActiveRecord::Schema.define(version: 20150227132723) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.text     "body"
    t.integer  "user_id"
    t.integer  "question_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "autoparts", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "price"
    t.integer  "availability",         default: 0
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string "name"
  end

  create_table "certificates", force: true do |t|
    t.integer  "content_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "certificates", ["content_id"], name: "index_certificates_on_content_id", using: :btree

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "news_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contents", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "comments_count",       default: 0
    t.string   "email"
  end

  create_table "imports", force: true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "snapshots_count"
    t.integer  "new_parts"
    t.integer  "found_parts"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state"
    t.text     "error_message"
    t.text     "necessary_columns"
    t.text     "headers"
    t.string   "type"
  end

  create_table "inspection_request_service_types", force: true do |t|
    t.integer "inspection_request_id"
    t.integer "service_type_id"
  end

  create_table "inspection_requests", force: true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.text     "comment"
    t.boolean  "viewed"
    t.integer  "viewed_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: true do |t|
    t.string   "asset_file_name"
    t.integer  "asset_file_size"
    t.string   "asset_content_type"
    t.boolean  "active",             default: true
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "partner_id"
  end

  create_table "products", force: true do |t|
    t.string   "part_number"
    t.string   "made_by"
    t.string   "car_brand"
    t.string   "model"
    t.string   "name"
    t.float    "count"
    t.float    "price"
    t.string   "sae"
    t.text     "specification"
    t.text     "description"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "answers_count", default: 0
  end

  create_table "roles", force: true do |t|
    t.string "name"
  end

  create_table "service_types", force: true do |t|
    t.string "name"
  end

  create_table "snapshots", force: true do |t|
    t.text    "body"
    t.integer "import_id"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
