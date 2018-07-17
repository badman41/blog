Rails.application.routes.draw do
  scope "(:locale)", :locale => /en|vn/ do
    root "static_pages#home"
    get "/home", to: "static_pages#home"
    get "/about", to: "static_pages#help", as: "about"
    get  '/signup',  to: 'users#new'
    get 'sessions/new'
    get 'users/new'
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "password_resets/new"
    get "password_resets/edit"
    get 'follow/following'
    get 'follow/follower'
    get "following/:id", to:"follow#following", as: "following"
    get "followers/:id", to:"follow#followers", as: "followers"
    resources :users
    resources :account_activations, only: [:edit]
    resources :password_resets, only: [:new, :create, :edit, :update]
    resources :relationships, only: [:create, :destroy]
  end
end
