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

ActiveRecord::Schema.define(version: 20140305203221) do

  create_table "activities", force: true do |t|
    t.integer  "color"
    t.integer  "date"
    t.float    "total_costs"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tip"
    t.string   "time_to"
    t.string   "time_from"
  end

  create_table "lambings", force: true do |t|
    t.integer  "sheep_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lamb_id"
    t.boolean  "is_alive"
    t.integer  "activity_id"
    t.float    "weight"
  end

  create_table "matings", force: true do |t|
    t.integer  "male_id"
    t.float    "price"
    t.integer  "activity_id"
    t.integer  "sheep_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sheep", force: true do |t|
    t.string   "code"
    t.integer  "mother_id"
    t.integer  "father_id"
    t.integer  "weight_100_days"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.text     "sex"
    t.text     "describe"
  end

  create_table "sheep_purchases", force: true do |t|
    t.float    "price"
    t.string   "place"
    t.integer  "activity_id"
    t.integer  "sheep_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sheep_sellings", force: true do |t|
    t.integer  "activity_id"
    t.integer  "sheep_id"
    t.float    "weight"
    t.float    "price"
    t.string   "place"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vaccinations", force: true do |t|
    t.string   "reason"
    t.string   "vaccin_name"
    t.integer  "date"
    t.integer  "time"
    t.float    "total_costs"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vacinations", force: true do |t|
    t.string   "reason"
    t.string   "vaccin_name"
    t.integer  "activity_id"
    t.integer  "sheep_id"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
