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

ActiveRecord::Schema.define(version: 2019_04_21_221811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_characters", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "character_id", null: false
    t.index ["book_id"], name: "index_book_characters_on_book_id"
    t.index ["character_id"], name: "index_book_characters_on_character_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "name", null: false
    t.string "isbn"
    t.text "authors", array: true
    t.integer "number_of_pages"
    t.string "publisher"
    t.string "country"
    t.string "media_type"
    t.string "released"
  end

  create_table "characters", force: :cascade do |t|
    t.text "aliases", array: true
    t.string "name", null: false
    t.string "born"
    t.string "culture"
    t.string "died"
    t.integer "gender", null: false
    t.text "played_by", array: true
    t.text "titles", array: true
    t.bigint "father_id"
    t.bigint "mother_id"
    t.bigint "spouse_id"
    t.index ["father_id"], name: "index_characters_on_father_id"
    t.index ["mother_id"], name: "index_characters_on_mother_id"
    t.index ["spouse_id"], name: "index_characters_on_spouse_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "title", limit: 50, default: "", null: false
    t.text "comment", null: false
    t.string "commentable_type", null: false
    t.bigint "commentable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "house_characters", force: :cascade do |t|
    t.bigint "house_id", null: false
    t.bigint "character_id", null: false
    t.index ["character_id"], name: "index_house_characters_on_character_id"
    t.index ["house_id"], name: "index_house_characters_on_house_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "name", null: false
    t.string "region"
    t.string "coat_of_arms"
    t.string "words"
    t.text "titles", array: true
    t.text "authors", array: true
    t.bigint "overlord_id"
    t.bigint "founder_id"
    t.string "founded"
    t.string "died_out"
    t.text "ancestral_weapons", array: true
    t.text "cadet_branches", array: true
    t.bigint "current_lord_id"
    t.bigint "heir_id"
    t.index ["current_lord_id"], name: "index_houses_on_current_lord_id"
    t.index ["founder_id"], name: "index_houses_on_founder_id"
    t.index ["heir_id"], name: "index_houses_on_heir_id"
    t.index ["overlord_id"], name: "index_houses_on_overlord_id"
  end

end
