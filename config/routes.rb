Rails.application.routes.draw do
  scope "(:locale)", :locale => /en|vn/ do
    root "static_pages#home"
    get "/home", to: "static_pages#home"
    get "/about", to: "static_pages#help", as: "about"
  end
end
