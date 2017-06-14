Rails.application.routes.draw do
  resources :urls
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, :as => :users
  resources :urls, :as => :urls

  get '/', to:'shortener#index', as: :index
  get "/:short_url", to: "urls#show"
  get "url/:short_url", to: "urls#shortened", as: :shortened
end
