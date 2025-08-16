class Vote < ApplicationRecord
  belongs_to :ballot, inverse_of: :votes
  has_many :vote_choices, inverse_of: :vote, dependent: :destroy
  has_many :round_tallies

  validates_presence_of :topic, :n_selections, :method
  accepts_nested_attributes_for :vote_choices, allow_destroy: true

  enum :method, %i[singleround multidroplast]

  def tally_votes
    if self.singleround?
      self.round_tallies.build(round: 1, tally: make_tally(self.vote_choices.map { |vc| vc.choice.titleize })).save
    end

    if self.multidroplast?
      i = 1
      droppable = self.vote_choices.select { |vc| vc.droppable }.map { |vc| vc.choice }
      not_droppable = self.vote_choices.select { |vc| not vc.droppable }.map { |vc| vc.choice.titleize } + [ nil ]

      until droppable.length < 2 do
        t = make_tally(droppable + not_droppable)

        self.round_tallies.build(round: i, tally: t).save

        min_list =
          t
            .except!(*not_droppable)
            .min_by(&:last)

        droppable = t.select { |k, v| v > min_list[1] }.keys
        i = i + 1
      end
    end
  end

  private

  def make_tally(allow_list)
    VoteSubmission
      .where(vote_id: self.id)
      .map { |v| v.selections }
      .map {
        |s_plural|
          s_plural
            .select { |s| allow_list.include? s.selection }
            .reduce { |min, s| min.preference > s.preference  ? s : min }
      }
      .map { |c| c ? c.selection : nil }
      .tally
  end
end
