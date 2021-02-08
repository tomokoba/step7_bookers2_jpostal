Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  get 'home/about' => 'homes#about'
  get '/search' => 'search#search'
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy] 
    member do
     get :following, :followers
    end
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end

end