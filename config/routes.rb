Rails.application.routes.draw do
  get 'sessions/new'
  get 'welcome/home'
  resources :comments
  resources :beers
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
