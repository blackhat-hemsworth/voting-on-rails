class BallotsController < ApplicationController
  def index
    @ballots = Ballot.all
  end

  def show
    @ballot = Ballot.find(params[:id])
    @votes = @ballot.votes
  end

  def new
    @ballot = Ballot.new
    @ballot.votes.build
  end

  def create
    @ballot = Ballot.new(ballot_params)

    if @ballot.save
      redirect_to @ballot, notice: "Ballot was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  private
    def ballot_params
      params.require(:ballot).permit(:name, votes_attributes: [ :id, :topic, :choices, :n_selections ])
    end
end
