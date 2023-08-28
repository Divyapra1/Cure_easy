class AppointmentsController < ApplicationController

	before_action :find_user, only: [:new, :create, :show]
	
	def new
      @disc = Catalogue.find(session[:current_disc_id])
      @appointment = @user.appointments.new()
    #@user=User.find(params[:id])
    end
  
  def create
     @disc = Catalogue.find(session[:current_disc_id])
     @appointment = @user.appointments.new(select_date: params[:appointment][:select_date], select_time: params[:appointment][:select_time], catalogue_id: @disc.id)
   # @appointment = @user.appointments.new(appointment_params)

      if @appointment.save
         redirect_to details_path(@user)
      else 
        byebug
        flash[:alert] = @appointment.errors.full_messages
           render :new, status: :unprocessable_entity
      #notice: 'Appointment created successfully.'
      end
   end
    

    def show
      #begin
         @show=@user.appointments.all
         #raise 'NoMethodError'
           
         #rescue
           #redirect_to root_path, notice: 'Not Have any appointments'
    #end
 end

    def details 
        @updated_user = User.find(params[:id])
    end

    def create_details
        @updated_user = User.find(params[:id])
        if @updated_user.update(details_params)
           message = TwilioTextMessenger.new(@updated_user.whatsapp_no, "Welcome to Cure easy app") if @updated_user.persisted?
           message.call
           redirect_to "/thank_you/#{@updated_user.id}"
        else 
            render :details, notice: 'Please enter valid details' 
        end
    end

    def reschedule
      @schedule=Appointment.find(params[:id])
    end

    def update_schedule
      @schedule=Appointment.find(params[:id])
      @user = User.find(@schedule.user_id)
      catalogue=Catalogue.find(@schedule.catalogue_id)
      time = @schedule.select_time.strftime('%H:%M:%S')
      if @schedule.update(update_datetime)
         flash[:success] = "Profile updated successfully."
         message = TwilioTextMessenger.new(@user.whatsapp_no, "Your appointment Has been reschedule, new date is #{@schedule.select_date}, new time is #{time}, Catalogue name is #{catalogue.name}") if @user.persisted?
         message.call
         UserMailer.update_send(@user, @schedule).deliver_now
         redirect_to show_appointments_path(@schedule.service_provider_id)
      else 
         flash[:error] = "Failed to update profile."
         render :reschedule
      end
    end

    def complete_appointment
      @appointment=Appointment.find(params[:id])
      if @appointment.update(status: 'Complete')
         redirect_to show_appointments_path(@appointment.service_provider_id), notice: "You Appointment has successfully completed."
      end
    end
    def confirmed_appointment #This function is to show erders which are Confirmed and checked
      @confirmed = Appointment.where(service_provider_id: params[:id], status: "Complete")
    end

    
   private

    def find_user
    	@user = User.find(params[:id])
    end

   # def appointment_params
   #   params.require(:user_appointment).permit(:select_date, :select_time, :catalogue_id)
   # end
   def details_params
     params.require(:user).permit(:firstname, :whatsapp_no, :age, :gender)
   end
   def update_datetime
      params.require(:appointment).permit(:select_date, :select_time)
   end
end
