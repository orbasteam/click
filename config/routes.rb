Rails.application.routes.draw do
  root 'static_page#welcome'
  get 'static_page/welcome'
  resources :channels
end
