Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'urls/index'
      get 'urls/show'
      post 'urls/create'
      # post not working below
      # resources :urls, only: [:index, :show, :create]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
