Rails.application.routes.draw do
  root 'request#index'  
  resources :request  
end
