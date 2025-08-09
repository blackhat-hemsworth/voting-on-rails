class Ballot < ApplicationRecord
  # TODO: cannot create -- likely has_many. check gh version vote<ballot
  # TODO: BallotSubmission add
  has_many :votes, inverse_of: :ballot
  belongs_to :election

  accepts_nested_attributes_for :votes
end
