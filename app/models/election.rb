class Election < ApplicationRecord
  has_many :ballots
  has_many :participants

  accepts_nested_attributes_for :ballots, :participants
end
