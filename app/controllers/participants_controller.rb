class ParticipantsController < ApplicationController
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

  private
    def participant_params
      params.require(:participant).permit(:name, :emails)
    end
end
