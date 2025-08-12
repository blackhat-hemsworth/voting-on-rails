class VoteSubmissionsController < ApplicationController
  before_action :set_vote_submission, only: %i[ show edit update destroy ]

  # GET /vote_submissions or /vote_submissions.json
  def index
    @vote_submissions = VoteSubmission.all
  end

  # GET /vote_submissions/1 or /vote_submissions/1.json
  def show
  end

  # GET /vote_submissions/new
  def new
    @vote_submission = VoteSubmission.new
  end

  # GET /vote_submissions/1/edit
  def edit
  end

  # POST /vote_submissions or /vote_submissions.json
  def create
    @vote_submission = VoteSubmission.new(vote_submission_params)

    respond_to do |format|
      if @vote_submission.save
        format.html { redirect_to @vote_submission, notice: "Vote submission was successfully created." }
        format.json { render :show, status: :created, location: @vote_submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vote_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vote_submissions/1 or /vote_submissions/1.json
  def update
    respond_to do |format|
      if @vote_submission.update(vote_submission_params)
        format.html { redirect_to @vote_submission, notice: "Vote submission was successfully updated." }
        format.json { render :show, status: :ok, location: @vote_submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vote_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vote_submissions/1 or /vote_submissions/1.json
  def destroy
    @vote_submission.destroy!

    respond_to do |format|
      format.html { redirect_to vote_submissions_path, status: :see_other, notice: "Vote submission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

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
