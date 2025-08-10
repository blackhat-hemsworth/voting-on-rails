class Ballot < ApplicationRecord
  # TODO: BallotSubmission add
  has_many :votes, inverse_of: :ballot
  belongs_to :election

  accepts_nested_attributes_for :votes
end
