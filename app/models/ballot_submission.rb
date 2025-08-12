class BallotSubmission < ApplicationRecord
  belongs_to :ballot, inverse_of: :ballot_submissions
  has_many :vote_submissions, inverse_of: :ballot_submission, dependent: :destroy

  accepts_nested_attributes_for :vote_submissions
end
