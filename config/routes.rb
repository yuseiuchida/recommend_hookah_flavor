Rails.application.routes.draw do
  resources :goods
  resources :aims
  resources :flavors
  resources :recommends
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
