class VoteChoice < ApplicationRecord
  belongs_to :vote, inverse_of: :vote_choices
  has_and_belongs_to_many :vote_submissions, optional: true
end
