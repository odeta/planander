Rails.application.routes.draw do
  root 'static_pages#home' # automatically creates a helper root_url
  get '/signup',   to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
end
