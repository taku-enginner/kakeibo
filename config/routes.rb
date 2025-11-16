Rails.application.routes.draw do
  get "user_group/index"
  get "user_group/show"
  get "user_group/new"
  get "user_group/create"
  get "user_group/edit"
  get "user_group/update"
  get "user_group/destroy"
  get "user/index"
  get "user/show"
  get "user/new"
  get "user/create"
  get "user/edit"
  get "user/update"
  get "user/destroy"
  get "receipt_category/index"
  get "receipt_category/show"
  get "receipt_category/new"
  get "receipt_category/create"
  get "receipt_category/edit"
  get "receipt_category/update"
  get "receipt_category/destroy"
  get "home/index"
  get "receipt/index"
  get "receipt/show"
  get "receipt/new"
  get "receipt/create"
  get "receipt/edit"
  get "receipt/update"
  get "receipt/destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
