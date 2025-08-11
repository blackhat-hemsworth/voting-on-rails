class VoteChoice < ApplicationRecord
  belongs_to :vote, inverse_of: :vote_choices
end
