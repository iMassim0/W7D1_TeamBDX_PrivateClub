Rails.application.routes.draw do
  root 'static_pages#home'

  resources :users

  get '/signup', to: 'users#new', as: 'signup'

  get    '/login',   to: 'sessions#new', as: 'login'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy', as:'logout'

  get '/index', to: "users#index", as: 'index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
