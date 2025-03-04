Rails.application.routes.draw do
  devise_for :users

  root "users#index"
  resources :users , only: [:index,:show] do
    resources :posts, only: [:index, :new, :create ,:show ] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end 
  end
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get 'mc_questions/new', to: 'mc_questions#new', as: 'new_mc_question'

  # Defines the root path route ("/")
  # root "posts#index"
end
