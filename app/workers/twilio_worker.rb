class TwilioWorker
  include Sidekiq::Worker

  def perform(phone_number, message)
    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'] 
 
    @client.account.messages.create({
      :from => '+19177467982', 
      :to => phone_number, 
      :body => translation,  
    })
  end
end