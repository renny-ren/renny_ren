Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ch|ja/ do
    root 'home#index', as: 'home'
    resources :articles

    resources :about, :archives, only: :index
    resources :tags, only: [:index, :create, :show, :destroy], param: :tag_name
    resources :messages, only: [:create, :destroy]
    post 'feedback', to: 'messages#feedback'

    resources :sentences, except: :show
    resources :sites, only: :index
  end

  resources :sessions, only: [:index, :create]
  resource :sessions, only: :destroy
end
