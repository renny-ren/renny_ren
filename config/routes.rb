Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :comments
  end

  post 'get_tag', to: "articles#get_tag"
  resources :about, :archives, only: :index
  resources :sessions, only: [:index, :create]
  resources :tags, only: [:index, :create, :show], param: :tag_name
  resource :sessions, only: :destroy
end
