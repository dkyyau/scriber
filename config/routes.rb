Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/dashboard" ,to: "pages#dashboard"

 resources :user_subscriptions, only: [ :show, :new, :create, :edit, :update, :destroy] do
    resources :reminders, only: [ :index, :show, :new, :create, :edit,:update]
  end
  resources :reminders, only: [:destroy]
end
