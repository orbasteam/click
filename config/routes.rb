Rails.application.routes.draw do

  get 'logs/index'

  get 'users/index'

  get 'users/new'

  get 'users/edit'

  root 'static_page#welcome'

  get 'static_page/welcome'

  resources :channels
  resources :tasks
end
