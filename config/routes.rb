Rails.application.routes.draw do
  resources :contacts
  resources :reports
  get 'user_review/create'
  get 'user_review/new'

  get 'exchange/create'

  get 'exchange/new'

  get 'exchange/index'

  get 'userreview', :to => 'user_reviews#index'

  resources :proposed_books
  resources :desidered_books
  resources :proposals
  resources :exchanges
  resources :user_reviews
  
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  get 'userssearch', :to => 'users#search'
  get 'booksearch', :to => 'proposed_books#search'
  get 'welcome/hello'
  get 'odinarecensioni', :to => 'user_reviews#ordina'

  post 'proposal', :to => 'proposals#create'

  post 'accetta', :to => 'proposals#accetta'
  post 'rifiuta', :to => 'proposals#rifiuta'

  root 'welcome#hello#'

  resources :users
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
