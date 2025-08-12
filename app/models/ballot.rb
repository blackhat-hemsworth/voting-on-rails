class Ballot < ApplicationRecord
  has_many :votes, inverse_of: :ballot, dependent: :destroy
  has_many :choices, through: :votes
  has_many :ballot_submissions, dependent: :destroy
  belongs_to :election

  accepts_nested_attributes_for :votes

  # TODO: url_key / uuid shit
  # TODO: job for submissions
  # TODO: vote submissions
  def make_submission(participant)
    ballot_submissions
      .build(
        ballot_name: name,
        state: :created,
        participant_id: participant.id,
        url_key: "TEST"
      )
      .save
  end
end
