Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :comments
  end

  resources :about, :archives, only: :index
  resources :sessions, only: [:index, :create]
  resources :tags, only: [:index, :create, :show, :destroy], param: :tag_name
  resource :sessions, only: :destroy
end
