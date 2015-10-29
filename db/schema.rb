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

ActiveRecord::Schema.define(version: 20151029191124) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.string   "name"
    t.string   "band_leader"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer  "band_id"
    t.integer  "event_id"
    t.date     "date"
    t.string   "kind"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: :cascade do |t|
    t.integer  "event_id"
    t.text     "notes"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_to"
  end

  create_table "documents", force: :cascade do |t|
    t.integer  "event_id"
    t.string   "title"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "client_first_name"
    t.string   "client_last_name"
    t.string   "planning_date"
    t.date     "final_date"
    t.integer  "job_identification_number"
    t.string   "status"
    t.string   "primary_contact"
    t.string   "secondary_contact"
    t.string   "primary_contact_phone"
    t.string   "secondary_contact_phone"
    t.string   "primary_contact_email"
    t.string   "secondary_contact_email"
    t.text     "guests"
    t.date     "inquiry_date"
    t.string   "event_type"
    t.string   "referred_by"
    t.string   "venue"
    t.string   "third_contact"
    t.string   "third_contact_phone"
    t.string   "third_contact_email"
    t.string   "fourth_contact"
    t.string   "fourth_contact_phone"
    t.string   "fourth_contact_email"
    t.string   "start_time"
    t.string   "end_time"
    t.string   "continuous"
    t.string   "contract_price"
    t.string   "ot_price"
    t.string   "sold_by"
    t.string   "number_of_musicians"
    t.string   "number_of_vocalists"
    t.string   "hours"
    t.string   "notes"
    t.string   "planner_name"
    t.string   "planner_email"
    t.string   "planner_phone"
    t.boolean  "sales_meeting_box",         default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "primary_contact_title"
    t.string   "secondary_contact_title"
    t.string   "third_contact_title"
    t.string   "fourth_contact_title"
    t.date     "contract_sent"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "company"
  end

  create_table "links", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "linked_event_job_number"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "name"
    t.date     "notification_date"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
