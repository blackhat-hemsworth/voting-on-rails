class VoteChoice < ApplicationRecord
  belongs_to :vote, inverse_of: :vote_choices

  validates_presence_of :choice

  has_and_belongs_to_many :vote_submissions, optional: true
end
