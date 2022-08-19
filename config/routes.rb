Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # add url paths below
      resources :urls, only: [:index, :show, :create]
      # add statistic urls
      get "statistics", to: "statistics#index"
      get "statistics/:id", to: "statistics#show"
      post "statistics", to: "statistics#create" 
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "api/v1/urls#index"
end
