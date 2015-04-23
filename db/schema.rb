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

ActiveRecord::Schema.define(version: 20150422104659) do

  create_table "channels", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "logs", force: :cascade do |t|
    t.string   "ip",           limit: 255
    t.string   "referer",      limit: 255
    t.text     "agent",        limit: 65535
    t.datetime "click_time"
    t.string   "token",        limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "redis_log_id", limit: 255
  end

  create_table "task_error_logs", force: :cascade do |t|
    t.string   "task_name",   limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "channel_id",  limit: 4
    t.string   "name",        limit: 255
    t.text     "target_url",  limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.text     "description", limit: 65535
    t.string   "token",       limit: 255
    t.integer  "click_count", limit: 4,     default: 0
  end

  add_index "tasks", ["channel_id"], name: "index_tasks_on_channel_id", using: :btree

end
