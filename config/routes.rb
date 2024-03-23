Rails.application.routes.draw do
  # resources :comments
  root "profiles#index"
  
  devise_for :users, controllers: { registrations: 'users/registrations'}
  resources :users do
    member do
      put :change_role_to_seller
    end
  end
  
  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
  get 'cart/show'
  get "/profiles", to: "profiles#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  authenticate :user do
    resources :products 
    post 'buy', to: 'buy_products#create', as: :buy
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
