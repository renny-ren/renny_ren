Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ch/ do
    root 'articles#index'
    resources :articles do
      resources :comments
    end

    resources :about, :archives, only: :index
    resources :tags, only: [:index, :create, :show, :destroy], param: :tag_name
  end

  resources :sessions, only: [:index, :create]
  resource :sessions, only: :destroy
end
