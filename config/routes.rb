Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'}  do
    namespace :v1 do
      resources :items
      resources :images
      resources :levels 
      resources :users, only: %i[create show update] do
        get :avatar, on: :member
      end
      
      post 'authenticate', to: 'authentication#authenticate'
      root to: "static#home"
    end
  end
end