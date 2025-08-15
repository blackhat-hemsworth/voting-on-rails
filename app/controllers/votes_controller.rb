class VotesController < ApplicationController
  private

  def vote_params
    params.require(:vote).permit(:method, :topic, :n_selections, selections_attributes: %i[id selection], vote_choices_attributes: [ :id, :choice ])
  end
end
