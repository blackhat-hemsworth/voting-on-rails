class VoteSubmission < ApplicationRecord
  has_many :selections, inverse_of: :vote, dependent: :destroy
  accepts_nested_attributes_for :selections, :vote_choices
end
