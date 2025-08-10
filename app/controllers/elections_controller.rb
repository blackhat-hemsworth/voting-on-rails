class ElectionsController < ApplicationController
  before_action :set_election, only: [ :show, :destroy, :update ]

  def new
    @election = Election.new
  end

  def show
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

  def destroy
    @election.destroy
    redirect_to elections_path
  end

  def update
    if @election.update(election_params)
      redirect_to @election
    else
      render :show, status: :unprocessable_entity
    end
  end

  private
    def election_params
      params.require(:election).permit(:name, :description, participants_attributes: [ :name, :email  ])
    end

    def set_election
      @election = Election.find(params[:id])
    end
end
