Rails.application.routes.draw do
  get "contact", to: "static_page#contact"
  root "static_page#home_page"   
  resources :product
  resources :user do
    member do
      get :cart, :bill
    end
  end
  get "log_in", to: "session#new"
  post "log_in", to: "session#create"
  delete "logout", to: "session#destroy"
end
