# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # Override the method to redirect users based on status after sign up
  def create
     super
     resource=User.find_by(email: params[:user][:email])
    if resource.status == 'Guest'
       root_path
    elsif resource.status == 'Service_provider'
      other_page_path # Replace 'other_page_path' with the actual path you want to redirect to
    else
      # Add a default path here if needed
     root_path
    end
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
end
