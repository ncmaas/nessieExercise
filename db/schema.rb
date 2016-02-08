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

ActiveRecord::Schema.define(version: 20160205200035) do

  create_table "accounts", force: :cascade do |t|
    t.string   "uid"
    t.string   "the_type"
    t.string   "nickname"
    t.integer  "rewards"
    t.integer  "balance"
    t.string   "account_number"
    t.string   "customer_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "alerts", force: :cascade do |t|
    t.string   "the_type"
    t.string   "description"
    t.datetime "time"
    t.string   "merchant"
    t.integer  "amount"
    t.string   "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "atms", force: :cascade do |t|
    t.float    "lat"
    t.float    "long"
    t.string   "uid"
    t.string   "name"
    t.string   "languages"
    t.string   "hours"
    t.boolean  "accessibility"
    t.integer  "amount_left"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "location_requests", force: :cascade do |t|
    t.float    "lat"
    t.float    "long"
    t.integer  "radius"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transfer_requests", force: :cascade do |t|
    t.string   "medium"
    t.string   "payee_id"
    t.integer  "amount"
    t.string   "transaction_date"
    t.string   "status"
    t.string   "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "transfers", force: :cascade do |t|
    t.string   "uid"
    t.string   "the_type"
    t.string   "date"
    t.string   "status"
    t.string   "medium"
    t.string   "payer_id"
    t.string   "payee_id"
    t.integer  "amount"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
