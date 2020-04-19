Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  scope "(:locale)", locale: /en|ch|ja/ do
    root 'home#index', as: 'home'
    resources :articles do
      resources :comments
    end

    resources :about, only: :index
    resources :messages, only: [:create, :destroy]
    post 'feedback', to: 'messages#feedback'

    resources :sentences, except: :show
    resources :sites, only: :index
    resources :changelogs, except: :show
    resources :videos do
      resources :comments
    end
  end

  resources :sessions, only: [:index, :create]
  resource :sessions, only: :destroy
end
