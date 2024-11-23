Rails.application.routes.draw do
  devise_for :users, controllers: {
                       sessions: "users/sessions",
                       registrations: "users/registrations",
                     }, path: "", path_names: {
                       sign_in: "login",        # Mengubah /users/sign_in menjadi /login
                       sign_out: "logout",      # Mengubah /users/sign_out menjadi /logout
                       sign_up: "register",     # Mengubah /users/sign_up menjadi /register
                       edit: "profile/edit",     # Opsional, mengubah /users/edit menjadi /profile/edit
                     }

  get "dashboard/index", as: :root
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
