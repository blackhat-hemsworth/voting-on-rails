class Election < ApplicationRecord
  has_many :ballots, dependent: :destroy
  has_many :participants, dependent: :destroy

  accepts_nested_attributes_for :ballots, :participants
end
