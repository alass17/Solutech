Rails.application.routes.draw do

  root 'pages#home'
  devise_for :users
  resources :categories

  resources :produits
  # root 'produits#index'
  

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
