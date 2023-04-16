Rails.application.routes.draw do
  scope "(:locale)", locale: /en|ch|ja/ do
    root "home#index", as: "home"
    resources :articles do
      resources :comments, only: [:create, :destroy]
    end

    resources :about, only: :index
    resources :messages, only: [:create, :destroy]
    post "feedback", to: "messages#feedback"

    resources :sentences, except: :show
    resources :sites, only: :index
    resources :changelogs, except: :show
    resources :videos do
      resources :comments, only: [:create, :destroy]
    end
  end

  resources :sessions, only: [:index, :create]
  resource :sessions, only: :destroy
  resources :uploads, only: [:create]

  get "/feed" => "articles#feed", as: :feed, defaults: { format: "atom" }

  if Rails.env.production?
    get "404", to: "application#page_not_found"
    get "422", to: "application#server_error"
    get "500", to: "application#server_error"
  end
end
