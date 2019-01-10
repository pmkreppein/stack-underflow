Rails.application.routes.draw do
  resources :questions do
    resources :answers, only: [:create]
  end

  resources :users, only: [:new, :create]
  get 'auth/:provider/callback' => 'sessions#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  root "questions#index"
end
