class Selection < ApplicationRecord
  belongs_to :vote_submission, inverse_of: :selections

  validates_presence_of :selection
end
