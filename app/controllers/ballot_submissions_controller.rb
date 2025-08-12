class BallotSubmissionsController < ApplicationController
  before_action :set_ballot_submission, only: %i[show edit update]

  def show
  end

  def edit
    puts 'EDITING'
    return unless @ballot_submission.state != 'submitted'

    puts @ballot_submission.state
    @ballot_submission.vote_submissions.each do |vote_sub|
      vote_sub.n_selections.times { vote_sub.selections.build }
    end
  end

  def update
    @ballot_submission.state = :submitted
    if @ballot_submission.save
      redirect_to @ballot_submission
    else
      render :edit, status: :unprocessable_entity
    end
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
      .permit(:id, :ballot_name, :ballot_id, :participant_id,
              :participant_email, :state,
              vote_submission_attributes: [
                selection_attributes: [
                  :selection
                ]
              ])
  end
end
