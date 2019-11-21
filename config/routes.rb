Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      scope :merchants do
        get '/find', to: 'merchants/find#show'
        get '/find_all', to: 'merchants/find#index'
        get '/random', to: 'merchants/random#show'
      end
      resources :merchants, only: [:index, :show]
    end
  end
end
