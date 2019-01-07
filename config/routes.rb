Rails.application.routes.draw do
  get 'user/new'

  root 'welcome#index'
end
