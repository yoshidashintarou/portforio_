Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'

  resources :users
  resources :posts


  get "search" => "searches#search"

end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
