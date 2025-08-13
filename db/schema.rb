ActiveRecord::Schema[8.0].define(version: 20_250_809_010_023) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'pg_catalog.plpgsql'
  enable_extension 'pgcrypto'

  create_table 'elections', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'ballots', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'status', default: 0
    t.string 'name', null: false
    t.bigint 'election_id', null: false
    t.index [ 'election_id' ], name: 'index_ballots_on_election_id'
  end

  create_table 'participants', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name', null: false
    t.string 'email', null: false
    t.bigint 'election_id', null: false
    t.index [ 'election_id' ], name: 'index_participants_on_election_id'
  end

  create_table 'votes', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'topic', null: false
    t.string 'method', null: false
    t.integer 'n_selections', null: false
    t.bigint 'ballot_id', null: false
    t.index [ 'ballot_id' ], name: 'index_votes_on_ballot_id'
  end

  create_table 'vote_choices', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'choice', null: false
    t.bigint 'vote_id', null: false
    t.index [ 'vote_id' ], name: 'index choices on vote id'
  end

  create_table 'ballot_submissions', force: :cascade, id: :uuid do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'ballot_name', null: false
    t.integer 'status', default: 0
    t.string 'participant_email', null: false
    t.bigint 'ballot_id', null: false
    t.index [ 'ballot_id' ], name: 'index_ballot_submission_on_ballot_id'
    t.bigint 'participant_id', null: false
    t.index [ 'participant_id' ], name: 'index_ballot_submission_on_participant_id'
  end

  create_table 'vote_submissions', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'topic', null: false
    t.integer 'n_selections', null: false
    t.uuid 'ballot_submission_id', null: false
    t.index [ 'ballot_submission_id' ], name: 'index_vote_submission_on_ballot_submission_id'
  end

   create_table "vote_choices_submissions", id: false, force: :cascade do |t|
      t.bigint 'vote_submission_id', null: false
      t.index [ 'vote_submission_id' ]
      t.bigint 'vote_choice_id', null: false
      t.index [ 'vote_choice_id' ]
   end

  create_table 'selections', force: :cascade do |t|
    t.bigint 'vote_submission_id', null: false
    t.string 'selection'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index [ 'vote_submission_id' ], name: 'index_selections_on_vote_submission_id'
  end

  add_foreign_key 'ballots', 'elections'
  add_foreign_key 'participants', 'elections'
  add_foreign_key 'selections', 'vote_submissions'
  add_foreign_key 'votes', 'ballots'
  add_foreign_key 'vote_choices', 'votes'
  add_foreign_key 'ballot_submissions', 'ballots'
  add_foreign_key 'vote_submissions', 'ballot_submissions'
end
