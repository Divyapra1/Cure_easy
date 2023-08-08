Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
   devise_for :users, controllers: {
  sessions: 'users/sessions'
}

  #get 'home/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index" 
  get "/categories/:id", to: "home#show"
    get "/catalouges/:id", to: "home#display"
  get "/discription/:id", to: "home#discription" 
 

end
