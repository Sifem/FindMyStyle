Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  


  get "select_silhouette", to: "pages#select_silhouette"





  # post "select" => "user_silhouettes#select", as: :select
  # get "generate" => "user_silhouettes#generate", as: :generate
  # get "show" => "user_silhouettes#show", as: :user_silhouettes_show
  # patch "twosilhouettes" => "user_silhouettes#upload_back_photo", as: :upload_photo
  # post "process_payment" => "users#process_payment", as: :process_payment
  # get "payment" => "users#payment", as: :payment
  # get "show" => "users#payment", as: :user_show

  resources :silhouettes, only: [:show]
end
