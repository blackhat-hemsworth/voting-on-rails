class BallotsController < ApplicationController
  # TODO: hash id for url / email
  def index
    # TODO: ballot index view
    @ballots = Ballot.all
  end

  # TODO: ballot show
  def new
    @ballot = Ballot.new
    @ballot.votes.build
  end

  def create
    @ballot = Ballot.new(ballot_params)

    if @ballot.save
      redirect_to @ballot, notice: "Ballot was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def ballot_params
      params.require(:ballot).permit(votes_attributes: [ :id, :topic, :choices, :n_selections ])
    end
end
