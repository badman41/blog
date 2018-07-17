Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  scope "(:locale)", :locale => /en|vn/ do
    root "static_pages#home"
    get "/home", to: "static_pages#home"
    get "/about", to: "static_pages#help", as: "about"
    get  '/signup',  to: 'users#new'
    get 'sessions/new'
    get 'users/new'
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "password_resets/new"
    get "password_resets/edit"
    resources :users
    resources :account_activations, only: [:edit]
    resources :password_resets, only: [:new, :create, :edit, :update]
  end
end
