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

ActiveRecord::Schema.define(version: 20150709001444) do

  create_table "shortened_urls", force: :cascade do |t|
    t.string   "long_url",     limit: 1024, null: false
    t.string   "short_url"
    t.string   "submitter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shortened_urls", ["short_url"], name: "index_shortened_urls_on_short_url", unique: true
  add_index "shortened_urls", ["submitter_id"], name: "index_shortened_urls_on_submitter_id"

  create_table "tag_topics", force: :cascade do |t|
    t.string   "tag",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tag_topics", ["tag"], name: "index_tag_topics_on_tag", unique: true

  create_table "taggings", force: :cascade do |t|
    t.string   "tag_id",     null: false
    t.string   "tagger_id",  null: false
    t.string   "url_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "taggings", ["tagger_id"], name: "index_taggings_on_tagger_id"
  add_index "taggings", ["url_id"], name: "index_taggings_on_url_id"

  create_table "users", force: :cascade do |t|
    t.text     "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "visits", force: :cascade do |t|
    t.string   "visitor_id",  null: false
    t.string   "visited_url", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visits", ["visited_url"], name: "index_visits_on_visited_url"
  add_index "visits", ["visitor_id"], name: "index_visits_on_visitor_id"

end
