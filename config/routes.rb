Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  get "/search", to: "items#search"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/items", to: "items#index"
      post "/items", to: "items#create"
      get "/items/:id", to: "items#show"
      delete "/items/:id", to: "items#destroy"
    end
  end
end
