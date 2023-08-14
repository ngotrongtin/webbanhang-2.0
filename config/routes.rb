Rails.application.routes.draw do
  get "contact", to: "static_page#contact"
  root "static_page#home_page"   
  resources :product, except: [:index ] do 
    member do
      post :cart, :bill
    end
  end
  resources :user do 
    member do 
      get :cart, :bill 
    end
  end
  patch "admin/:id", to: "user#active_admin", as: :admin
  get "log_in", to: "session#new"
  post "log_in", to: "session#create"
  delete "logout", to: "session#destroy"
  delete "cart_destroy/:pd_id", to: "product#cart_destroy", as: :cart_destroy
  get "default", to: "static_page#not_found"
end
