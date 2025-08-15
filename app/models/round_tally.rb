class RoundTally < ApplicationRecord
  belongs_to :vote

  serialize :tally, coder: YAML
end
