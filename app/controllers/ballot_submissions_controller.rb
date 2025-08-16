class BallotSubmissionsController < ApplicationController
  before_action :set_ballot_submission, only: %i[show edit update]
  allow_unauthenticated_access

  def show
  end

  def edit
    return unless @ballot_submission.ready?

    @ballot_submission.vote_submissions.each do |vote_sub|
      vote_sub.n_selections.times { |i| vote_sub.selections.build({ preference: i + 1 }) }
    end
  end

  def update
    @ballot_submission.submitted!
    if @ballot_submission.update(ballot_submission_params)
      redirect_to @ballot_submission
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_ballot_submission
    @ballot_submission = BallotSubmission.find(params.expect(:id))
  end

  def ballot_submission_params
    params
      .require(:ballot_submission)
      .permit(:id, :ballot_name, :ballot_id, :participant_id,
              :participant_email, :state,
              vote_submissions_attributes: [
                :id,
                :topic,
                :n_selections,
                selections_attributes: [
                  :id,
                  :selection,
                  :preference
                ]
              ])
  end
end
