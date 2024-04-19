Rails.application.routes.draw do

  devise_for :users
  resources :users do
    resources :recommendations, only: :index
  end
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # post "select" => "user_silhouettes#select", as: :select
  # get "generate" => "user_silhouettes#generate", as: :generate
  # patch "twosilhouettes" => "user_silhouettes#upload_back_photo", as: :upload_photo
  # post "process_payment" => "users#process_payment", as: :process_payment
  # get "payment" => "users#payment", as: :payment
  resources :silhouettes, only: %i[show index]

  get "select_silhouette", to: "pages#select_silhouette"
  get "style_profile", to: "pages#style_profile"


  get "find_my_style", to: "pages#find_my_style"
  get "home", to: "pages#home"

end
