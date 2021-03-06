Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show] do
    get :scan, on: :collection
  end
  resources :consumables, only: [:new, :create, :destroy]

  get "dashboards", to: "dashboards#profile"
  get "history", to: "dashboards#history"
end
