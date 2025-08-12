class Vote < ApplicationRecord
  belongs_to :ballot, inverse_of: :votes
  has_many :vote_choices, inverse_of: :vote, dependent: :destroy

  accepts_nested_attributes_for :vote_choices
end
