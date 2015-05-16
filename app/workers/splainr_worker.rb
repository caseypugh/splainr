class SplainrWorker
  include Sidekiq::Worker

  def perform(phone_number, query)
    # number = Number::create_from_number!(phone_number, message)
    translation = SplainrTranslator::execute(query)

    sleep_timer = 0
    is_phone = false

    if translation.blank?
      TwilioWorker.new.perform(phone_number, 'Ehhhh... boring.', false)
    end

    translation.each do |text|
      is_phone = true and next if text == Dictionary::IS_PHONE

      sleep sleep_timer
      puts "#{is_phone ? 'CALLING' : 'TEXTING'} #{phone_number} #{text}"
      TwilioWorker.new.perform(phone_number, text, is_phone)
      sleep_timer += 2 
    end
  end
end