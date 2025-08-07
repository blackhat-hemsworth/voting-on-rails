class Vote < ApplicationRecord
  belongs_to :ballot, inverse_of: :votes
  # TODO: refactor selections to VoteSubmission
  has_many :selections, inverse_of: :vote, dependent: :destroy
  accepts_nested_attributes_for :selections
end
