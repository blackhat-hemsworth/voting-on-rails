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

ActiveRecord::Schema[8.0].define(version: 2025_08_16_033654) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pgcrypto"

  create_table "ballot_submissions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ballot_name", null: false
    t.integer "status", default: 0
    t.string "participant_email", null: false
    t.bigint "ballot_id", null: false
    t.bigint "participant_id", null: false
    t.index [ "ballot_id" ], name: "index_ballot_submission_on_ballot_id"
    t.index [ "participant_id" ], name: "index_ballot_submission_on_participant_id"
  end

  create_table "ballots", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
    t.string "name", null: false
    t.bigint "election_id", null: false
    t.index [ "election_id" ], name: "index_ballots_on_election_id"
  end

  create_table "elections", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "email", null: false
    t.bigint "election_id", null: false
    t.index [ "election_id" ], name: "index_participants_on_election_id"
  end

  create_table "round_tallies", force: :cascade do |t|
    t.integer "round", null: false
    t.string "tally", null: false
    t.bigint "vote_id", null: false
    t.index [ "vote_id" ], name: "index_round_tallies_on_vote_id"
  end

  create_table "selections", force: :cascade do |t|
    t.bigint "vote_submission_id", null: false
    t.integer "preference", null: false
    t.string "selection", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [ "vote_submission_id" ], name: "index_selections_on_vote_submission_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [ "user_id" ], name: "index_sessions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index [ "email_address" ], name: "index_users_on_email_address", unique: true
  end

  create_table "vote_choices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "choice", null: false
    t.boolean "droppable", null: false
    t.bigint "vote_id", null: false
    t.index [ "vote_id" ], name: "index choices on vote id"
  end

  create_table "vote_choices_submissions", id: false, force: :cascade do |t|
    t.bigint "vote_submission_id", null: false
    t.bigint "vote_choice_id", null: false
    t.index [ "vote_choice_id" ], name: "index_vote_choices_submissions_on_vote_choice_id"
    t.index [ "vote_submission_id" ], name: "index_vote_choices_submissions_on_vote_submission_id"
  end

  create_table "vote_submissions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "topic", null: false
    t.integer "n_selections", null: false
    t.bigint "vote_id", null: false
    t.uuid "ballot_submission_id", null: false
    t.index [ "ballot_submission_id" ], name: "index_vote_submission_on_ballot_submission_id"
    t.index [ "vote_id" ], name: "index_vote_submission_on_vote_id"
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "topic", null: false
    t.integer "method", null: false
    t.integer "n_selections", null: false
    t.bigint "ballot_id", null: false
    t.index [ "ballot_id" ], name: "index_votes_on_ballot_id"
  end

  add_foreign_key "ballot_submissions", "ballots"
  add_foreign_key "ballots", "elections"
  add_foreign_key "participants", "elections"
  add_foreign_key "round_tallies", "votes"
  add_foreign_key "selections", "vote_submissions"
  add_foreign_key "sessions", "users"
  add_foreign_key "vote_choices", "votes"
  add_foreign_key "vote_submissions", "ballot_submissions"
  add_foreign_key "vote_submissions", "votes"
  add_foreign_key "votes", "ballots"
end
