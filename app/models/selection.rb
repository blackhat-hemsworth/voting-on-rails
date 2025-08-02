class Selection < ApplicationRecord
  belongs_to :vote, inverse_of: :selections
end
