Rails.application.routes.draw do
  resources :proposed_books
  resources :desidered_books
  devise_for :users
  get 'userssearch', :to => 'users#search'
  get 'booksearch', :to => 'proposed_books#search'
  get 'welcome/hello'
  root 'welcome#hello#'
  resources :users


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
