# TODO: find way to have relative id PER vote_submission
class Selection < ApplicationRecord
  belongs_to :vote_submission, inverse_of: :selections
end
