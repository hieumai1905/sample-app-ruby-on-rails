Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    resources :products
    get "mo_partials/new"
    get "demo_partials/edit"
    get "static_pages/home"
    get "static_pages/help"
    resources :users
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end
end
