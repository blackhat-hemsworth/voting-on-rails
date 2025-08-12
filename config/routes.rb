Rails.application.routes.draw do
  resources :elections do
    resources :participants
    resources :ballots
  end

  resources :votes, only: %i[index show new create]
  resources :ballot_submissions, only: %i[show update]

  root "elections#index"
  get "up" => "rails/health#show", as: :rails_health_check

  get "/votes", to: "votes#index"
  get "votes/new", controller: "votes", action: :new

  get "/ballots", to: "ballots#index"
  get "ballots/new", controller: "ballots", action: :new
end
