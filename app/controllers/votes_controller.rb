class VotesController < ApplicationController
  # HACK: remove defaults (eventually)
  def new(topic = "Mayor's Race", choices = %w[ Abstain Brenda Davis Fateh Frey Hampton NoEndorsement ], n_selections = 3)
    @vote = Vote.new({ topic: topic, choices: choices, n_selections: n_selections })
    @vote.n_selections.times { @vote.selections.build }
  end

  def show
    @vote = Vote.find(params[:id])
  end

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      redirect_to @vote
    else
      render :new, status: :unprocessable_content
    end
  end

  private
    def vote_params
      params.require(:vote).permit(selections_attributes: [ :id, :selection ])
    end
end
