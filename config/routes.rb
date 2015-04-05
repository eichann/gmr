Rails.application.routes.draw do
  root 'impressions#index'
  resources :impressions
  resources :channels, only: [:show, :new, :create] do
    collection do
      get "search"
    end
  end
end