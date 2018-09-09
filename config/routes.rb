Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  resources :contacts
  resources :reports
  get 'user_review/create'
  get 'user_review/new'
  get 'exchange/create'

  get 'exchange/new'

  get 'exchange/index'

  get 'userreview', :to => 'user_reviews#index'

  resources :proposed_books
  delete 'destroy_proposed_book', :to => 'proposed_books#destroy'

  resources :desidered_books
  delete 'destroy_desidered_book', :to => 'desidered_book#destroy'

  resources :proposals
  resources :exchanges
  resources :user_reviews
  delete 'destroy_user_review', :to => 'user_reviews#destroy'
  
  resources :users
  get 'userssearch', :to => 'users#search'
  get 'booksearch', :to => 'proposed_books#search'
  get 'welcome/hello'
  get 'odinarecensioni', :to => 'user_reviews#ordina'

  post 'proposal', :to => 'proposals#create'

  post 'accetta', :to => 'proposals#accetta'
  post 'rifiuta', :to => 'proposals#rifiuta'

  root 'welcome#hello#'
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
