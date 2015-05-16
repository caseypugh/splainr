class TwilioWorker
  include Sidekiq::Worker

  def perform(phone_number, message)
    puts 'HELLO'
    client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'] 
 
    client.account.messages.create({
      from: '+19177467982', 
      to:   phone_number, 
      body: message
    })
  end
end