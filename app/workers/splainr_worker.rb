class SplainrWorker
  include Sidekiq::Worker

  def perform(phone_number, message)
    # number = Number::create_from_number!(phone_number, message)
    translation = SplainrTranslator::execute(message)

    TwilioWorker.preform_async(phone_number, translation)
    # Rails.logger.debug message
    # Rails.logger.debug translation
  end
end