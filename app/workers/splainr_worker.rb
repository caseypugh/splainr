class SplainrWorker
  include Sidekiq::Worker

  def perform(phone_number, message)
    # number = Number::create_from_number!(phone_number, message)
    translation = SplainrTranslator::execute(message)

    # Rails.logger.debug message
    # Rails.logger.debug translation
    TwilioWorker.preform_async(phone_number, translation)
    
    # TwilioWorker.perform_in(2.seconds, phone_number, translation)
  end
end