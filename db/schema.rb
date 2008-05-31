# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 8) do

  create_table "after_tasks", :id => false, :force => true do |t|
    t.integer "task_id"
    t.integer "after_task_id"
  end

  create_table "before_tasks", :id => false, :force => true do |t|
    t.integer "task_id"
    t.integer "before_task_id"
  end

  create_table "buyers", :id => false, :force => true do |t|
    t.integer  "customers_id"
    t.boolean  "purchased_without_account"
    t.string   "customers_gender"
    t.string   "customers_firstname"
    t.string   "customers_lastname"
    t.datetime "customers_dob"
    t.string   "customers_email_address"
    t.integer  "customers_default_address_id"
    t.string   "customers_telephone"
    t.string   "customers_fax"
    t.string   "customers_password"
    t.string   "customers_newsletter"
    t.string   "customers_group_name"
    t.integer  "customers_group_id"
  end

  create_table "people", :force => true do |t|
    t.string "type"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "email"
    t.float  "healthy_glow"
    t.float  "skill"
    t.string "name"
    t.string "ips"
    t.string "last_name"
  end

  create_table "people_people", :id => false, :force => true do |t|
    t.integer "first_person_id"
    t.integer "second_person_id"
  end

  create_table "servants", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "host"
    t.string   "protocol"
    t.string   "user"
    t.string   "password"
    t.string   "magic"
    t.integer  "clicks",         :default => 0
    t.string   "account_number"
    t.string   "method",         :default => "get"
    t.string   "name"
  end

  create_table "shoppers", :id => false, :force => true do |t|
    t.string "pass"
    t.string "address1"
    t.string "address2"
    t.string "address3"
    t.string "email"
    t.string "user"
    t.string "first_name"
    t.string "last_name"
  end

  create_table "tasks", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "code"
    t.string   "name"
    t.text     "output"
    t.datetime "time"
    t.boolean  "done",       :default => false
    t.integer  "base_id"
  end

end
