Rails.application.routes.draw do
  root 'impressions#index'
  resources :impressions
end