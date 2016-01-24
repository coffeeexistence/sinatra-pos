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

ActiveRecord::Schema.define(version: 4) do

  create_table "customer_sessions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "customer_id"
    t.integer "vehicle_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.string  "phone"
    t.string  "street"
    t.string  "zip"
    t.string  "email"
    t.string  "notes"
    t.integer "user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "discount_amount"
    t.string  "notes"
    t.integer "user_id"
    t.integer "customer_session_id"
  end

  create_table "items", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.integer "quantity_available"
    t.integer "user_id"
    t.integer "category_id"
  end

  create_table "labor_records", force: :cascade do |t|
    t.string  "labor_description"
    t.integer "labor_hours"
    t.integer "hourly_rate"
    t.integer "price_override"
    t.integer "customer_session_id"
  end

  create_table "purchase_records", force: :cascade do |t|
    t.string  "supply_or_resale"
    t.integer "cost_per_each"
    t.integer "quantity_bought"
    t.integer "total_cost"
    t.integer "item_id"
    t.integer "user_id"
  end

  create_table "sales_records", force: :cascade do |t|
    t.string  "description_override"
    t.integer "resale_price"
    t.integer "quantity"
    t.integer "item_id"
    t.integer "customer_session_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "shop_name"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string  "year"
    t.string  "make"
    t.string  "model"
    t.string  "engine"
    t.string  "EFN"
    t.string  "VIN"
    t.integer "customer_id"
    t.integer "customer_session_id"
  end

end
