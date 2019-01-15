Rails.application.routes.draw do
  root 'sessions#new' # automatically creates a helper root_url
  get    '/signup',      to: 'users#new'
  post   '/signup',      to: 'users#create'
  post   '/login',       to: 'sessions#create'
  delete '/logout',      to: 'sessions#destroy'
  get    '/home',        to: 'static_pages#month_view'
  get    '/day',         to: 'static_pages#day_view'
  get    '/week',        to: 'static_pages#week_view'
  get    '/month',       to: 'static_pages#month_view'
  get    '/year',        to: 'static_pages#year_view'
  post   '/updatetitle', to: 'calendars#update'
  
  resources :users, except: %i[show]
  resources :calendars, only: %i[create]
  resources :events, only: %i[create]
end
