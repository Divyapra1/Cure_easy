class RegistrationsController < Devise::RegistrationsController
	 
  def create
    super do |resource|
      resource.status = params[:user][:status]
      resource.save
    end
  end
end
