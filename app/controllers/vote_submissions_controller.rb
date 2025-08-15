# TODO: see what can be deleted
class VoteSubmissionsController < ApplicationController
  before_action :set_vote_submission, only: %i[update]

  def update
    if @vote_submission.update(vote_submission_params)
      redirect_to ballot_submission_url(@vote_submission.ballot_submission)
    else
    render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_vote_submission
    @vote_submission = VoteSubmission.find(params.expect(:id))
  end

  def vote_submission_params
    params
      .require(:vote_submission)
      .permit(:id, selections_attributes: %i[id preference selection])
  end
end
