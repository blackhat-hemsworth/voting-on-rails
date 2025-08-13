class BallotSubmissionMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ballot_submission_mailer.ballot_open.subject
  #
  def ballot_open
    @ballot_submission = params[:ballot_submission]
    election_name = params[:election_name]

    greeting = election_name.titleize + ": Voting is now open for " + @ballot_submission.ballot_name.titleize

    mail(to: @ballot_submission.participant_email, subject: greeting)
  end
end
