class Election < ApplicationRecord
  has_many :ballots, dependent: :destroy
  has_many :participants, dependent: :destroy

  validates_presence_of :name

  accepts_nested_attributes_for :ballots, :participants
end
