Rails.application.routes.draw do
  root 'impressions#index'
  resources :impressions
  resources :channels, only: [:show, :new, :create, :update] do
    collection do
      get "search"
    end
    member do
      post "check_password"
    end
  end
end