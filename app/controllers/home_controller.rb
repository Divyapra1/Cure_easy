class HomeController < ApplicationController
   before_action :find_appointment, on: [:show_appointments]
   #before_action :find_appointment_details, on: [:appointment_details]
  
  
  def index
    @category=Category.all
  end

  def show
     category=Category.find(params[:id])
     @subcategory=category.sub_categories
  end
    
  def display
     sub_category=SubCategory.find(params[:id])
     @catalouge=sub_category.catalogues   
  end

  def discription #This function is to define discription for catalogue and for service
      @disc=Catalogue.find(params[:id])  
      session[:current_disc_id] = @disc.id
  end

  def profile
   @user=User.find(params[:id])
  end

  def update_profile
   @user=User.find(params[:id])
   if @user.update(user_params)
       flash[:success] = "Profile updated successfully."
       redirect_to user_profile_path(@user)
   else
      flash[:error] = "Failed to update profile."
      render :profile # Render the 'edit' view template
    end
  end

  def privacy_policy  
  end

  def about_us
  end
 #----------------------- Service-Provider Functions
  def show_appointments
      
  end
  def appointment_details
   @details=Appointment.find(params[:id])
  end
  
  def checkin  #this function is to provide checkin functionality
     @images=Appointment.find(params[:id])
  end

  def upload_image  #This function is to provide Submission of chekin images
    @images=Appointment.find(params[:id])
    if @images.update(image_params)
       redirect_to confirm_appointment_path(@images), notice: "Your picture has been successfully uploaded."
     
    else
      flash.now[:alert] = "Failed to upload picture."
      render :checkin 
     end
   end

   def confirm_appointment
      @confirm=Appointment.find(params[:id]) # This Function  is to provide the check in and confirm the appointment
   end

   def submit_appointment
      @confirm=Appointment.find(params[:id])
   end 
#-------------------------------------------
  def search 
     query = params[:query] 

    if Category.where('name LIKE ?', "%#{query}%").present?
       @results=Category.where('name LIKE ?', "%#{query}%")

    end
  end

 

  
 
 private
  def user_params
   params.require(:user).permit(:firstname,:lastname, :whatsapp_no, :age, :gender, :main_image)
  end

  def find_appointment
   @service_provider=Appointment.where(service_provider_id:params[:id], status: 'Incomplete')

  end

  def image_params
    params.require(:appointment).permit(picture: [])
  end

  
    
end
#<ActiveRecord::Associations::CollectionProxy []>