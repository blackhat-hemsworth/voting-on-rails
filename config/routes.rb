Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :elections do
    resources :participants, only: %i[destroy]
    resources :ballots do
      member do
        post :send_ballots
        post :tally_results
        post :fake_ballots
      end
    end
  end

  resources :ballot_submissions, only: %i[show edit update destroy] do
    resources :vote_submissions
  end

  root "elections#index"
  get "up" => "rails/health#show", as: :rails_health_check
end
