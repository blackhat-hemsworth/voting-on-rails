class VoteSubmission < ApplicationRecord
  belongs_to :ballot_submission, inverse_of: :vote_submissions
  has_many :selections, dependent: :destroy, autosave: true
  has_and_belongs_to_many :vote_choices, optional: true

  accepts_nested_attributes_for :selections
end
