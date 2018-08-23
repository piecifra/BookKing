Rails.application.routes.draw do
  devise_for :users
  get 'welcome/hello'
  root 'welcome#hello#'
  resources :users, only: [:show]
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
