class VotesController < ApplicationController
  private

  def vote_params
    params.require(:vote).permit(selections_attributes: %i[id selection method], vote_choices_attributes: [:choice])
  end
end
