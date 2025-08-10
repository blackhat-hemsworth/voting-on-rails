class ParticipantsController < ApplicationController
  before_action :get_election
  before_action :set_participant, only: [ :destroy ]

  def new
    @participant = Participant.new
  end

  def create
    @participant = participant.new(participant_params)

    if @participant.save
      redirect_to @participant, notice: "participant was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  def destroy
    @participant.destroy
    redirect_to election_path
  end

  private
    def participant_params
      params.require(:participant).permit(:name, :emails)
    end

    def get_election
      @election = Election.find(params[:election_id])
    end

    def set_participant
      @participant = Participant.find(params[:id])
    end
end
