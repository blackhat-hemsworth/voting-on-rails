# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_08_07_000141) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "ballots", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "selections", force: :cascade do |t|
    t.bigint "vote_id", null: false
    t.string "selection"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vote_id"], name: "index_selections_on_vote_id"
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "n_selections"
    t.string "choices", array: true
    t.string "topic"
    t.bigint "ballot_id", null: false
    t.index ["ballot_id"], name: "index_votes_on_ballot_id"
  end

  add_foreign_key "selections", "votes"
  add_foreign_key "votes", "ballots"
end
