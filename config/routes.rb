Rails.application.routes.draw do
  get "users/index"
  get "users/show"
  get "users/new"
  get "users/create"
  get "users/edit"
  get "users/update"
  get "users/destroy"
  get "receipts/index"
  get "receipts/show"
  get "receipts/new"
  get "receipts/create"
  get "receipts/edit"
  get "receipts/update"
  get "receipts/destroy"
  get "receipt_categories/index"
  get "receipt_categories/show"
  get "receipt_categories/new"
  get "receipt_categories/create"
  get "receipt_categories/edit"
  get "receipt_categories/update"
  get "receipt_categories/destroy"
  get "user_groups/index"
  get "user_groups/show"
  get "user_groups/new"
  get "user_groups/create"
  get "user_groups/edit"
  get "user_groups/update"
  get "user_groups/destroy"
  get "home/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
   root "home#index"
end
