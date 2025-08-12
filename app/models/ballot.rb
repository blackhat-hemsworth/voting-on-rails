require "securerandom"

class Ballot < ApplicationRecord
  has_many :votes, inverse_of: :ballot, dependent: :destroy
  has_many :vote_choices, through: :votes
  has_many :ballot_submissions, dependent: :destroy
  belongs_to :election

  accepts_nested_attributes_for :votes

  def make_submission(participant)
    ballot_submission =
      ballot_submissions
      .build(
        ballot_name: name,
        state: :created,
        participant_id: participant.id,
        participant_email: participant.email
      )
    ballot_submission.save

    # TODO: add vote_choice ref to vote_submissions
    votes.each do |vote|
      vote_submission =
        ballot_submission
        .vote_submissions
        .build(
          topic: vote.topic,
          n_selections: vote.n_selections
        )
      vote_submission.save
    end
  end
end
