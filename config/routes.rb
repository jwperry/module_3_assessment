Rails.application.routes.draw do
  root 'items#index'

  resources :items,  only: [:index, :show]
  resources :orders, only: [:index, :show]
  resources :users,  only: [:index, :show]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/items", to: "api_items#all_items"
      post "/items", to: "api_items#create"
      get "/items/:id", to: "api_items#show"
      delete "/items/:id", to: "api_items#destroy"
    end
  end
end
