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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131121024124) do

  create_table "adhoc_deliverables", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "project_phase_id"
    t.string   "complexity"
    t.string   "unit_of_measure"
    t.integer  "estimated_size"
    t.integer  "estimated_production_rate"
    t.integer  "estimated_effort"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "deliverable_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "lifecycle_phase_id"
    t.integer  "is_adhoc"
    t.string   "unit_of_measure"
  end

  create_table "deliverables", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "project_phase_id"
    t.integer  "deliverable_type_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "project_id"
    t.string   "complexity"
    t.string   "unit_of_measure"
    t.integer  "estimated_size"
    t.integer  "estimated_production_rate"
    t.integer  "estimated_effort"
    t.float    "actual_effort"
  end

  create_table "historical_data", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "complexity"
    t.string   "unit_of_measure"
    t.integer  "estimated_size"
    t.integer  "estimated_production_rate"
    t.integer  "estimated_effort"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "lifecycle_phases", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "lifecycle_id"
  end

  create_table "lifecycles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_phases", :force => true do |t|
    t.integer  "project_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "lifecycle_phase_id"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "lifecycle_id"
    t.integer  "user_id"
  end

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.integer  "project_id"
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
