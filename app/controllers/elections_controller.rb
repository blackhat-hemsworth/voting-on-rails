class ElectionsController < ApplicationController
  def new
    @election = Election.new
  end

  def show
    @election = Election.find(params[:id])
  end

  def index
    @elections = Election.all
  end

  def create
    @election = Election.new(election_params)

    if @election.save
      redirect_to @election, notice: "Election was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  private
    def election_params
      params.require(:election).permit(:name, :description)
    end
end
