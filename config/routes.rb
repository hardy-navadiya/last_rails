Rails.application.routes.draw do
  get 'home/index'
  get 'users/new'


  root 'home#index'
  resources :users
end
