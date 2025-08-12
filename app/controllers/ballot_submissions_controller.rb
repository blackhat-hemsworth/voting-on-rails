class BallotSubmissionsController < ApplicationController
  before_action :set_ballot_submission, only: %i[show edit update destroy]

  def index
    @ballot_submissions = BallotSubmission.all
  end

  def show
  end

  def new
    @ballot_submission = BallotSubmission.new
  end

  def edit
  end

  def create
    @ballot_submission = BallotSubmission.new(ballot_submission_params)
    @ballot_submission.url_key = "TEST"
    @ballot_submission.state = :created

    respond_to do |format|
      if @ballot_submission.save
        format.html { redirect_to @ballot_submission, notice: "Ballot submission was successfully created." }
        format.json { render :show, status: :created, location: @ballot_submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ballot_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @ballot_submission.update(ballot_submission_params)
        format.html { redirect_to @ballot_submission, notice: "Ballot submission was successfully updated." }
        format.json { render :show, status: :ok, location: @ballot_submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ballot_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ballot_submission.destroy!

    respond_to do |format|
      format.html do
        redirect_to ballot_submissions_path, status: :see_other, notice: "Ballot submission was successfully destroyed."
      end
      format.json { head :no_content }
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
      .permit(:ballot_name, :ballot_id, :participant_id)
  end
end
