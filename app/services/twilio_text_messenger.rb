require 'twilio-ruby'

class TwilioTextMessenger
   
#     def send_message(to,body)		
# 	    client = Twilio::REST::Client.new(ENV['twilio_account_sid'], ENV['twilio_auth_token'])

#          client.messages.create(
#             body: 'hello wellcome to Twillio',
#             from: ENV['twilio_phone_number'],
#             to: to
#             )
# 	end

  attr_reader :message, :number

  def initialize(number, message)
   @number = number
    @message = message
  end

  def call
    client = Twilio::REST::Client.new(ENV['twilio_account_sid'], ENV['twilio_auth_token'])
    client.messages.create({
      from: ENV['twilio_phone_number'],
      to: "+91"+number,
      body: message
    })
  end
end