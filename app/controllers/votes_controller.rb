# TODO: Ballot class -- votes, options, n_selections + view (what is part of vote vs ballot...)
# TODO: Ballot creation interface (use CLI at first)
# TODO: Election class -- is this needed?
# TODO: COUNT the votes
# TODO: User / etc. validation 1 user per ballot?

class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end
  def new
    @vote = Vote.new({ choices: %w[ Brenda Davis Fateh Frey Hampton ], n_selections: 3})
    @vote.n_selections.times { @vote.selections.build }
  end

  def show
  end

  def create
    @vote = Vote.new(vote_params) # TODO: refactor after actual multi select

    if @vote.save
      redirect_to @vote
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def vote_params
      params.require(:vote).permit(selections_attributes: [ :id, :selection ])
    end
end
