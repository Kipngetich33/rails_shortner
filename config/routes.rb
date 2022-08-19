Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # add url endpoint paths
      resources :urls, only: [:index, :show, :create]
      get "urls", to: "urls#index"
      get "urls:/:id", to: "urls#show" 
      post "urls", to: "urls#create"
      post "urls/redirect", to: "urls#redirect"
      # add statistic endpoint paths
      get "statistics", to: "statistics#index"
      get "statistics/:id", to: "statistics#show"
      post "statistics", to: "statistics#create" 
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "api/v1/urls#index"
end
