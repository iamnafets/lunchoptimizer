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

ActiveRecord::Schema.define(:version => 20110827071649) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "default_longitude"
    t.float    "default_latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
    t.integer  "owner_id"
  end

  create_table "groups_restaurants", :id => false, :force => true do |t|
    t.integer "group_id"
    t.integer "restaurant_id"
  end

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.datetime "sent_date"
    t.integer  "lunch_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "response"
    t.datetime "response_date"
  end

  create_table "lunches", :force => true do |t|
    t.string   "name"
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "host_user_id"
    t.integer  "host_group_id"
    t.date     "date"
    t.boolean  "anonymous",     :default => false
  end

  create_table "lunches_groups", :id => false, :force => true do |t|
    t.integer "lunch_id"
    t.integer "group_id"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants", :force => true do |t|
    t.string   "name"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "restaurants_categories", :id => false, :force => true do |t|
    t.integer "restaurant_id"
    t.integer "category_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_groups", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "users_lunches", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "lunch_id"
  end

end
