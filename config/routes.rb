Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :create, :update, :show], :as => :users
  resources :urls, only: [:index, :create, :show], :as => :urls

  get '/', to:'shortener#index', as: :index
  get "/:short_url", to: "urls#show"
  get "url/:short_url", to: "urls#shortened", as: :shortened
end
