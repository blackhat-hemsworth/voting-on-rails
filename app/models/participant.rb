class Participant < ApplicationRecord
  belongs_to :election, inverse_of: :participants
end
