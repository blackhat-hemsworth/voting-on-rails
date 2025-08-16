class Ballot < ApplicationRecord
  has_many :votes, inverse_of: :ballot, dependent: :destroy
  has_many :vote_choices, through: :votes
  has_many :ballot_submissions, dependent: :destroy
  belongs_to :election

  validates_presence_of :name

  accepts_nested_attributes_for :votes, allow_destroy: true

  enum :status, { "created": 0, "sent": 1, tallied: 2 }

  def make_submission(participant)
    ballot_submission =
      ballot_submissions
      .build(
        ballot_name: name,
        participant_id: participant.id,
        participant_email: participant.email
      )
    ballot_submission.save

    votes.each do |vote|
      vote_submission =
        ballot_submission
          .vote_submissions
          .build(
            topic: vote.topic,
            n_selections: vote.n_selections,
            vote_id: vote.id
          )
      vote_submission.save
      vote.vote_choices.each do |vote_choice|
        vote_choice.vote_submissions << vote_submission
        vote_choice.save
      end
    end

    ballot_submission.email_ballot
  end

  # def tally_ballots
  #   ballot_submissions.each do |sub|
  #     sub.closed!
  #   end

  #   votes.each do |v|
  #     v.tally_votes
  #   end

  #   self.tallied!
  # end

  def fake_submission(participant)
    ballot_submission =
      ballot_submissions
      .build(
        ballot_name: name,
        participant_id: participant.id,
        participant_email: participant.email,
        status: :submitted,
      )
    ballot_submission.save

    votes.each do |vote|
      vote_submission =
        ballot_submission
        .vote_submissions
        .build(
          topic: vote.topic,
          n_selections: vote.n_selections,
          vote_id: vote.id,
        )
      vote_submission.save

      vote.n_selections.times { |i| vote_submission.selections.build(preference: i + 1, selection:  vote.vote_choices.sample.choice.titleize).save }
      vote.vote_choices.each do |vote_choice|
        vote_choice.vote_submissions << vote_submission
        vote_choice.save
      end
    end
  end
end
