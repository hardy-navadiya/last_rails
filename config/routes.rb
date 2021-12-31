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

  # create microposts
  get 'micropost' => 'microposts#new'

  # delete microposts 
  delete 'destroy' => 'microposts#destroy'

  root 'home#index'
  resources :users
  resources :microposts, only: [:create, :destroy]
end
