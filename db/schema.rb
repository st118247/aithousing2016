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

ActiveRecord::Schema.define(version: 20161204165712) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "housing_details", force: :cascade do |t|
    t.integer  "version_id"
    t.string   "category_id"
    t.string   "status"
    t.string   "category_name"
    t.string   "dorm"
    t.string   "size"
    t.string   "air_con"
    t.string   "balcony"
    t.string   "bathroom"
    t.string   "kitchen"
    t.string   "furniture"
    t.string   "cleaning"
    t.string   "description"
    t.string   "rent"
    t.string   "attachment"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "officer_roles", force: :cascade do |t|
    t.string   "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_histories", force: :cascade do |t|
    t.string   "category_no"
    t.string   "dorm"
    t.string   "student_id"
    t.datetime "arrival_date"
    t.datetime "leave_date"
    t.integer  "allocated_user_id"
    t.integer  "deallocated_user_id"
    t.integer  "room_management_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["room_management_id"], name: "index_room_histories_on_room_management_id", using: :btree
  end

  create_table "room_managements", force: :cascade do |t|
    t.string   "room_no"
    t.string   "category_no",  null: false
    t.string   "dorm",         null: false
    t.string   "status",       null: false
    t.string   "student_id"
    t.datetime "arrival_date"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_room_managements_on_user_id", using: :btree
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
    t.string   "staff_id"
    t.string   "name"
    t.string   "surname"
    t.string   "tel"
    t.string   "status"
    t.integer  "officer_role_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["officer_role_id"], name: "index_users_on_officer_role_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "room_histories", "room_managements"
  add_foreign_key "room_managements", "users"
  add_foreign_key "users", "officer_roles"
end
