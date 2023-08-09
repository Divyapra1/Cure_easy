class AppointmentsController < ApplicationController
	#before_action :find_user
	
	def new
    #@appointment = @user.appointments.build
    @user=User.find(params[:id])
     end
  
  def create
    @appointment1 = @user.appointments.build(person_params)
    if @appointment1.save
      redirect_to user_appointments_path(@user), notice: 'Appointment created successfully.'
    else
      render :new
    end
end
 def show

 end

private
 def find_user
 	@user=User.find(params[:id])
 end
def person_params
  params.require(:appointment).permit(:select_date, :select_time)
end
end
