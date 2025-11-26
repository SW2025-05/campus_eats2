Rails.application.routes.draw do
  devise_for :users
  resources :shops do
    resources :reviews, only: [:create, :edit, :update, :destroy]
  end

  resources :users

  root "shops#index"
end
