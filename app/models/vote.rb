class Vote < ApplicationRecord
  belongs_to :ballot, inverse_of: :votes
  has_many :vote_choices, inverse_of: :vote, dependent: :destroy
  has_many :round_tallies

  accepts_nested_attributes_for :vote_choices, allow_destroy: true

  enum :method, %i[singleround multidroplast]

  def tally_votes
    choices = self.vote_choices.map { |vc| vc.choice }
    if self.singleround?
      self.round_tallies.build(tally: make_tally(choices)).save
    end

    if self.multidroplast?
      # TODO: droplast logic on choices + stopping logic
      self.round_tallies.build(tally: make_tally(choices)).save
    end
  end

  def make_tally(allow_list)
    puts allow_list
    VoteSubmission
      .where(vote_id: self.id)
      .map { |v| v.selections }
      .map {
        |s_plural| s_plural.reduce {
          |min, s| min.preference < s.preference & (allow_list.include? s.selection) ? min : s
        }
      }
      .map { |c| c.selection }
      .tally
  end
end
