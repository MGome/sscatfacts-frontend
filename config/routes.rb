Rails.application.routes.draw do

  resources :users, only: [:new, :create] do
    collection do
      get :my_cat_facts
    end
  end
  get 'index', to: 'main#index', as: 'logged_index'

  # Session routes
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'


  root 'main#home'
end
