Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
   devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}
    # resources :users do 
    #   resources :appointments
    # end


  #get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index" 
  get "/categories/:id", to: "home#show"
    get "/catalouges/:id", to: "home#display"
  get "/discription/:id", to: "home#discription" 
  get "/appointments/:id", to: "appointments#new", as: 'new_appointment'
  post "/appointments/:id", to: "appointments#create", as: 'create_appointment'
  get "/details/:id", to: "appointments#details", as: 'details'
  patch "/details/:id", to: "appointments#create_details", as: 'create_details'
  get '/thank_you/:id', to: 'appointments#thank_you'
  get '/show_appointments/:id', to: 'appointments#show'
  get '/search', to: "home#search", as: 'search'
  get '/service_provider_appointments/:id', to: "home#show_appointments", as: 'show_appointments'
  get '/user_profile/:id', to: "home#profile", as: 'user_profile'
  patch '/user_profile/:id', to: "home#update_profile", as: 'update_user_profile'
  get '/privacty_policy', to: "home#privacy_policy"
  get '/about_us', to: "home#about_us"
  get '/appointment_details/:id', to: "home#appointment_details"
  get '/reschedule_appointment/:id', to: "appointments#reschedule", as: 'reschedule_appointment'
  patch '/update_schedule/:id', to: "appointments#update_schedule", as: 'update_schedule'
  get '/check_in/:id', to: "home#checkin", as: 'check_in'
  patch '/upload_images/:id', to: "home#upload_image", as: 'upload_image'
  get '/confirm_appointment/:id', to: "home#confirm_appointment", as: 'confirm_appointment'
  patch '/submit_appointment/:id', to: "home#submit_appointment", as: 'submit_appointment'
  get '/complete_appointment/:id', to: "appointments#complete_appointment", as: 'complete_appointment'
  get '/confirmed_appointment/:id', to: "appointments#confirmed_appointment", as: 'confirmed_appointment'
 

end
