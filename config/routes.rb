Rails.application.routes.draw do

  root 'welcome#home'

  resources :users

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  delete "/signout", to: "sessions#destroy"

  get '/auth/facebook/callback' => 'sessions#create'
end
