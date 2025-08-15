class Selection < ApplicationRecord
  belongs_to :vote_submission, inverse_of: :selections
end
