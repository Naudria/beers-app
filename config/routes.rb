Rails.application.routes.draw do

  root 'welcome#home'

  resources :users, only: [:new, :create, :show] do
    resources :beers
    resources :comments
  end



  resources :beers do
    resources :comments # Nested Resource # /posts/1/comments
  end



  get 'beers/:id', to: 'beers#show'
  get 'beers/:id/next', to: 'beers#next'


  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  post '/signout' => 'sessions#destroy'
  delete "/signout", to: "sessions#destroy"

  get '/auth/facebook/callback' => 'sessions#create'
end
