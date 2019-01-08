Rails.application.routes.draw do
  get 'static_pages/home'

  get 'user/new'

  root 'welcome#index'
end
