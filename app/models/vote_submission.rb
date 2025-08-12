class VoteSubmission < ApplicationRecord
  belongs_to :ballot_submission, inverse_of: :vote_submissions
  has_many :selections, inverse_of: :vote, dependent: :destroy
  accepts_nested_attributes_for :selections
end
