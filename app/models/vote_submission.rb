class VoteSubmission < ApplicationRecord
  belongs_to :ballot_submission, inverse_of: :vote_submissions
  has_many :selections, dependent: :destroy
  has_many :vote_choices

  accepts_nested_attributes_for :selections
end
