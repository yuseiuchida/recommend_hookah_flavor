Rails.application.routes.draw do
  root :to => 'static_pages#top'

  get 'search' => 'static_pages#top'
  post 'search' => 'static_pages#search'

  get 'flavors/search'

  get 'user_sessions/new'
  get 'user_sessions/create'
  get 'user_sessions/destroy'

  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :users
  resources :flavors do
    resources :reviews, shallow: true
    collection do
      get :bookmarks
    end
  end

  resources :categories
  resources :bookmarks, only: %i[create destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
