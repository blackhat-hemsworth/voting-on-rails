class Vote < ApplicationRecord
  belongs_to :ballot, inverse_of: :votes
  has_many :vote_choices, inverse_of: :vote, dependent: :destroy
  has_many :round_tallies

  accepts_nested_attributes_for :vote_choices, allow_destroy: true

  enum :method, %i[singleround multidroplast]

  def tally_votes
    choices = self.vote_choices.map { |vc| vc.choice }
    if self.singleround?
      self.round_tallies.build(round: 1, tally: make_tally(choices)).save
    end

    if self.multidroplast?
      # TODO: droplast logic on choices + stopping logic
      # TODO: abstain / no endorsement handle? potentially another column...

      self.round_tallies.build(round: 1, tally: make_tally(choices)).save
    end
  end

  private

  def make_tally(allow_list)
    VoteSubmission
      .where(vote_id: self.id)
      .map { |v| v.selections }
      .map {
        |s_plural| s_plural.reduce {
          |min, s| (min.preference > s.preference) & (allow_list.include? s.selection) ? s : min
        }
      }
      .map { |c| c ? c.selection : nil }
      .tally
  end
end
