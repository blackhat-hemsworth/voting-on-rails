# TODO: results object? Is that a case for Job handling?
class Ballot < ApplicationRecord
  has_many :votes, inverse_of: :ballot, dependent: :destroy
  has_many :vote_choices, through: :votes
  has_many :ballot_submissions, dependent: :destroy
  belongs_to :election

  accepts_nested_attributes_for :votes, allow_destroy: true

  enum :status, { "created": 0, "sent": 1, tallied: 2 }

  def make_submission(participant)
    ballot_submission =
      ballot_submissions
      .build(
        ballot_name: name,
        participant_id: participant.id,
        participant_email: participant.email
      )
    ballot_submission.save

    votes.each do |vote|
      vote_submission =
        ballot_submission
        .vote_submissions
        .build(
          topic: vote.topic,
          n_selections: vote.n_selections
        )
      vote_submission.save
      vote.vote_choices.each do |vote_choice|
        vote_choice.vote_submissions << vote_submission
        vote_choice.save
      end
    end

    ballot_submission.email_ballot
  end
end
