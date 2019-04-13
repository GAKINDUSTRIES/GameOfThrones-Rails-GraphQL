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

ActiveRecord::Schema.define(version: 2019_04_12_230247) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: :cascade do |t|
    t.text "aliases", array: true
    t.text "allegiances", array: true
    t.string "name", null: false
    t.string "born"
    t.string "culture"
    t.string "died"
    t.string "father"
    t.integer "gender", null: false
    t.string "mother"
    t.text "playedBy", array: true
    t.string "spouse"
    t.text "titles", array: true
  end

end
