Rails.application.routes.draw do
  root 'sessions#new' # automatically creates a helper root_url
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/home',    to: 'static_pages#home'

  resources :users, except: %i[show]
end
