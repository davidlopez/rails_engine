Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/most_revenue', to: 'revenue#index'
        get '/revenue', to: 'revenue#show'
        get '/:id/favorite_customer', to: 'customers#show'
        get '/:id/items', to: 'items#index'
        get '/:id/invoices', to: 'invoices#index'
      end
      namespace :items do
        get '/most_revenue', to: 'revenue#index'
        get '/:id/best_day', to: 'dates#show'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/merchant', to: 'merchants#show'
      end
      namespace :invoices do
        get '/:id/items', to: 'items#index'
        get '/:id/invoice_items', to: 'invoice_items#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/customer', to: 'customers#show'
        get '/:id/merchant', to: 'merchants#show'
      end
      namespace :invoice_items do
        get '/:id/invoice', to: 'invoices#show'
        get '/:id/item', to: 'items#show'
      end
      namespace :transactions do
        get '/:id/invoice', to: 'invoices#show'
      end
      namespace :customers do
        get '/:id/invoices', to: 'invoices#index'
        get '/:id/transactions', to: 'transactions#index'
        get '/:id/favorite_merchant', to: 'merchants#show'
      end
      [:merchants, :items, :invoices, :customers, :invoice_items, :transactions].each do |option|
        namespace option do
          get '/find', to: 'find#show'
          get '/find_all', to: 'find#index'
          get '/random', to: 'random#show'
        end
        resources option, only: [:index, :show]
      end
    end
  end
end
