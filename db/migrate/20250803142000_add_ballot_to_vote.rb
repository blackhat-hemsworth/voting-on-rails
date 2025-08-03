class AddBallotToVote < ActiveRecord::Migration[8.0]
  def change
    add_reference :votes, :ballot, null: false, foreign_key: true
  end
end
