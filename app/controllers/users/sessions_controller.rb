# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # Override the method to redirect users based on status after sign up
  def create
  super do |resource|
      if resource.persisted?
        if resource.status == 'Guest'
          redirect_to root_path and return
        elsif resource.status == 'Service_provider'
          redirect_to show_appointments_path(resource.id) and return
        else
          render :new and return
        end
      end
    end
end

    # def destroy 
    #   super
    #   @resource=User.find(id: params[:id])
    #   @resource.destroy
    #   redirect_to root_path, status: :see_other
    # end

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
