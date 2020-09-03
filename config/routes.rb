Rails.application.routes.draw do
  devise_for :users
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/dashboard", to: "pages#dashboard"
  get "/admin", to: "pages#admin"
  post "/admin", to: "pages#send_reminder", as: :send_reminders

  resources :user_subscriptions, only: [ :show, :new, :create, :edit, :update, :destroy] do
    resources :reminders, only: [ :index, :show, :new, :create, :edit, :update ]
  end
  resources :reminders, only: [:destroy]
end

