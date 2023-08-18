Rails.application.routes.draw do
  root "static_page#home_page"  
  get "contact", to: "static_page#contact"
  resources :product, except: [:index ] do 
    member do
      get :cart, :bill
    end
  end
  resources :user do 
    member do 
      get :cart, :bill 
    end
  end
  resources :feedback, only: [:create, :destroy]
  patch "admin/:id", to: "user#active_admin", as: :admin
  get "log_in", to: "session#new"
  post "log_in", to: "session#create"
  delete "logout", to: "session#destroy"
  delete "cart_destroy/:pd_id", to: "product#cart_destroy", as: :cart_destroy
  get "default", to: "static_page#not_found"
  get "search", to: "static_page#search"
end
