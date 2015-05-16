class SplainrWorker
  include Sidekiq::Worker

  def perform(phone_number, message)
    # number = Number::create_from_number!(phone_number, message)
    translation = SplainrTranslator::execute(message)

    Rails.logger.debug message
    Rails.logger.debug translation

    @client = Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'] 
 
    @client.account.messages.create({
      :from => '+19177467982', 
      :to => phone_number, 
      :body => translation,  
    })
  end
end