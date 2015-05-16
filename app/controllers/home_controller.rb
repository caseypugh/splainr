class HomeController < ApplicationController
  def index

  end

  def mansplainr_response
    mansplaination = SplainrTranslator::execute(params[:Body])
    # sender = params[:From]
    # friends = {
    #   "+14153334444" => "Curious George",
    #   "+14158157775" => "Boots",
    #   "+14155551234" => "Virgil"
    # }
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message mansplaination
    end
    
    @response = twiml.text
  end
end
