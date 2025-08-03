class Ballot < ApplicationRecord
  # TODO: Election + update field
  has_many :votes, inverse_of: :ballot

  accepts_nested_attributes_for :votes
end
