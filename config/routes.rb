Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :comments
  end

  resources :about, only: :index
  resources :archives, only: :index
  resources :sessions, only: [:index, :create]
  resource :sessions, only: :destroy
end
