Rails.application.routes.draw do

  devise_for :users

  root 'home#top'
  get 'home/about'

  resources :users, only: [:show, :index, :edit, :update] do
  	get :about, on: :collection
    member do
      get :follows
      get :followers
    end
  end
  resources :books, only: [:show, :index, :create, :edit, :update, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
end
