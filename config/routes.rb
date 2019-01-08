Rails.application.routes.draw do
  resources :questions do 
    resources :answers, only: [:create]    
  end

  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  root "questions#index"
end
