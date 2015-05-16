class TwilioWorker
  include Sidekiq::Worker

  def perform(phone_number, message, is_phone = false)
    client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'] 
 
    if !is_phone
      client.account.messages.create({
        from: '+19177467982', 
        to:   phone_number, 
        body: message
      })
    else
      @client.account.calls.create({
        :to => phone_number, 
        :from => '+19177467982', 
        :url => "http://splainr.herokuapp.com/mansplainr-call.xml?message=",
        :method => 'GET',  
        :fallback_method => 'GET',  
        :status_callback_method => 'GET',    
        :record => 'false'
      })
    end
  end
end