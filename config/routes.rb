Rails.application.routes.draw do
  get 'users/liked_memes'
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  root to: "memes#index"
  resources :memes, only: %i[show new create update destroy edit] do
    resources :favorites, only: %i[create destroy]
    resources :likes, only: [:create, :destroy]
  end
  resources :tags, only: [:create]
  resources :favorites, only: [:index]
  get 'profile', to: 'users#show', as: 'current_user_profile'
  get '/liked_memes', to: 'users#liked_memes'
  get 'memes/:id/preview_text', to: 'memes#preview_text', as: :preview_text
  # post 'edit_meme/:id', to: 'memes#edit_meme', as: :edit_meme_test
  post 'clone', to: "memes#clone", as: :clone_meme
  get 'clone', to: "memes#clone", as: :clone_meme_get
end
