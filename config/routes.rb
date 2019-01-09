Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: {format: 'json'} do
      resources :webhook, only: [:create, :index], constraints: { format: 'json' } 
    end
  end
  root 'request#index'  
  resources :request  
end
