class UserMailer < ApplicationMailer
	def welcome_send(user)
		@user=user  
		mail to: user.email, subject: "Welcome to my site", from: "info@mysite.com"
	end
	def update_send(user, schedule)
		@user=user
		@schedule=schedule
		mail to: user.email, subject:  "Reschedule Appointment"
	end
end
