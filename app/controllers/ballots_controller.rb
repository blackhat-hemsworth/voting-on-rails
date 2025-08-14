class BallotsController < ApplicationController
  before_action :get_election
  before_action :set_ballot, only: %i[show edit update destroy send_ballots]

  def index
    @ballots = @election.ballots.all
  end

  def show
    @votes = @ballot.votes
  end

  def new
    @ballot = @election.ballots.build
    @vote = @ballot.votes.build
    2.times { @vote.vote_choices.build }
  end

  def create
    @ballot = @election.ballots.build(ballot_params)

    if @ballot.save
      redirect_to election_ballot_path(@election, @ballot), notice: "Ballot was successfully created."
    else
      puts @ballot.errors.full_messages
      render :new, status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @ballot.update(ballot_params)
      redirect_to election_ballot_path(@election, @ballot), notice: "Ballot was successfully created."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ballot.destroy
    redirect_to election_path(@election)
  end

  def send_ballots
    @ballot.election.participants.each do |p|
      @ballot.make_submission(p)
    end
    @ballot.sent!
  end

  private

  def ballot_params
    params
      .require(:ballot)
      .permit(:name, :election_id,
              votes_attributes: [
                :id, :topic, :choices, :n_selections, :method, :_destroy,
                { vote_choices_attributes: %i[id choice _destroy] }
              ])
  end

  def get_election
    @election = Election.find(params[:election_id])
  end

  def set_ballot
    @ballot = Ballot.find(params[:id])
  end
end
