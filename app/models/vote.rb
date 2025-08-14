class Vote < ApplicationRecord
  belongs_to :ballot, inverse_of: :votes
  has_many :vote_choices, inverse_of: :vote, dependent: :destroy

  accepts_nested_attributes_for :vote_choices, allow_destroy: true

  enum :method, %i[singleround multidroplast]

  def tally_votes
    if self.singleround!
      all_votes = VoteSubmission.where(vote_id: self.id)
      for v in all_votes do
        selection = v.selections.where(id: 1).first
        if selection
          puts selection.selection
        end
      end
    end

    nil
  end
end
