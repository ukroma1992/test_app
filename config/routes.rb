Rails.application.routes.draw do

  root 'teams#index'

  resources :tournaments, only: [:index] do
    member do
      post :register_team
      post :withdraw_team
    end
  end

  resources :teams, except: [:show]

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'sign_out', to: 'sessions#destroy', as: :sign_out
end
