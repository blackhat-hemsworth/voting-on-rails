class VoteChoice < ApplicationRecord
  belongs_to :vote, inverse_of: :vote_choices
  belongs_to :vote_submission, optional: true
end
