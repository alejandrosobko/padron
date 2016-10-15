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

ActiveRecord::Schema.define(version: 20161015050516) do

  create_table "dentists", force: :cascade do |t|
    t.string   "name"
    t.string   "surname"
    t.integer  "enrollment"
    t.string   "location"
    t.string   "institution"
    t.string   "street"
    t.integer  "number"
    t.integer  "telephone"
    t.integer  "cellphone"
    t.string   "email"
    t.string   "specialty"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "visitors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visits", force: :cascade do |t|
    t.datetime "visit_date"
    t.text     "observations"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "dentist_id"
    t.integer  "visitor_id"
  end

  add_index "visits", ["dentist_id"], name: "index_visits_on_dentist_id"
  add_index "visits", ["visitor_id"], name: "index_visits_on_visitor_id"

  create_table "work_calendars", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "dentist_id"
  end

  add_index "work_calendars", ["dentist_id"], name: "index_work_calendars_on_dentist_id"

  create_table "workable_days", force: :cascade do |t|
    t.string   "day"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "work_calendar_id"
  end

  add_index "workable_days", ["work_calendar_id"], name: "index_workable_days_on_work_calendar_id"

  create_table "workable_hours", force: :cascade do |t|
    t.integer  "from"
    t.integer  "to"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "workable_day_id"
  end

  add_index "workable_hours", ["workable_day_id"], name: "index_workable_hours_on_workable_day_id"

end
