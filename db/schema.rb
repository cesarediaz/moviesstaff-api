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

ActiveRecord::Schema.define(version: 2018_09_28_004953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "release_year"
  end

  create_table "movies_people", id: false, force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "movie_id", null: false
    t.string "role"
    t.index ["movie_id", "person_id"], name: "index_movies_people_on_movie_id_and_person_id"
    t.index ["person_id", "movie_id"], name: "index_movies_people_on_person_id_and_movie_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "aliases"
  end

end
