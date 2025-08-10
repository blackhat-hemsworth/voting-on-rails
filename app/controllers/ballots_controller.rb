class BallotsController < ApplicationController
  before_action :get_election

  def index
    @ballots = @election.ballots.all
  end

  def show
    @ballot = Ballot.find(params[:id])
    @votes = @ballot.votes
  end

  def new
    @ballot = @election.ballots.build
    @ballot.votes.build
  end

  def create
    puts ballot_params
    @ballot = @election.ballots.build(ballot_params)
    puts @ballot.inspect
    if @ballot.save
      redirect_to election_ballot_path(@election, @ballot), notice: "Ballot was successfully created."
    else
      puts @ballot.errors.full_messages
      render :new, status: :unprocessable_content
    end
  end

  private
    def ballot_params
      params.require(:ballot).permit(:name, :election_id, votes_attributes: [ :id, :topic, :choices, :n_selections ])
    end

    def get_election
      @election = Election.find(params[:election_id])
    end
end
