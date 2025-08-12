class BallotSubmissionsController < ApplicationController
  before_action :set_ballot_submission, only: %i[show]

  def show
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_ballot_submission
    @ballot_submission = BallotSubmission.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def ballot_submission_params
    params
      .require(:ballot_submission)
      .permit(:ballot_name, :ballot_id, :participant_id)
  end
end
