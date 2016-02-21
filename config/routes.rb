Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  resources :wants do
    collection do
      get "search"
    end
  end
  resources :users
end
