# Preview all emails at http://localhost:3000/rails/mailers/ballot_submission_mailer
class BallotSubmissionMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/ballot_submission_mailer/ballot_open
  def ballot_open
    BallotSubmissionMailer.ballot_open
  end
end
