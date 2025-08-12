class VoteSubmissionsController < ApplicationController
  before_action :set_vote_submission, only: %i[]

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vote_submission
    @vote_submission = VoteSubmission.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def vote_submission_params
    params.fetch(:vote_submission, {})
  end
end
