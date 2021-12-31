Rails.application.routes.draw do
  get 'sessions/new'
  get 'home/index'

  # signup
  get 'signup' => 'users#new'

  # signin
  get 'signin' => 'sessions#new'
  post 'signin' => 'sessions#create'

  # delete
  delete 'signout' => 'sessions#destroy'

  root 'home#index'
  resources :users
end
