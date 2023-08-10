Rails.application.routes.draw do
  get 'product/new'
  get 'product/edit'
  get 'product/show'
  get "contact", to: "static_page#contact"
  root "static_page#home_page"   
  resources :product, except: [:index ]
  resources :user do
    member do
      get :cart, :bill
    end
  end
  patch "admin/:id", to: "user#active_admin", as: :admin
  get "log_in", to: "session#new"
  post "log_in", to: "session#create"
  delete "logout", to: "session#destroy"
end
