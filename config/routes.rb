Rails.application.routes.draw do 
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  get '/cart', to: 'cart#show', as: 'cart_show'
  devise_for :users
  resources :users, controllers: { sessions: 'sessions' }
  #  root 'pages#home'

  resources :categories
  resources :categories, only: [] do
    member do
      get 'products_by_category'
    end
  end
   
  resources :carts

  resources :produits
  
  root 'produits#index'

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest', as: :guest_sign_in
    post 'users/admin_guest_sign_in', to: 'users/sessions#new_admin_guest', as: :admin_guest_sign_in
  end

  #  get 'categories/:category_id/products', to: 'products#products_by_category', as: 'products_by_category'  
  #  resources :categories do
  #   get 'products_by_category', on: :member
  #  end
  
  
# config/routes.rb (pour Rails 2.x)
# get "controller/action/:id", to: "controller#action", as: :cart/add

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
