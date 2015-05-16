class SplainrWorker
  include Sidekiq::Worker

  def perform(phone_number, query)
    # number = Number::create_from_number!(phone_number, message)
    translation = SplainrTranslator::execute(query)

    sleep_timer = 0
    translation.each do |text|
      sleep sleep_timer
      puts "TEXTING #{phone_number} #{text}"
      TwilioWorker.new.perform(phone_number, text)
      sleep_timer += 2
      sleep_timer += 4 if sleep_timer >= 2
    end
  end
end