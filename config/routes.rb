Rails.application.routes.draw do

  devise_for :users

  root 'home#top'
  get 'home/about'

  resources :users, only: [:show, :index, :edit, :update] do
  	get :about, on: :collection
  end
  resources :books, only: [:show, :index, :create, :edit, :update, :destroy] do
  	resource :favorites, only: [:create, :destroy]
  	resource :book_comments, only: [:create, :destroy]
  end
end
