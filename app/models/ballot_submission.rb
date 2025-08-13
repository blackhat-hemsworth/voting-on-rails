class BallotSubmission < ApplicationRecord
  belongs_to :ballot, inverse_of: :ballot_submissions
  has_many :vote_submissions, inverse_of: :ballot_submission, dependent: :destroy, autosave: true
  has_many :selections, through: :vote_submissions

  accepts_nested_attributes_for :vote_submissions

  enum :status, %i[ready submitted closed]

  def email_ballot
    BallotSubmissionMailer
      .with(ballot_submission: self, election_name: self.ballot.election.name)
      .ballot_open
      .deliver_later
  end
end
