Rails.application.routes.draw do
  resources :urls
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :as => :users
  resources :urls, :as => :urls

  get '/', :to => 'shortener#index'
end
