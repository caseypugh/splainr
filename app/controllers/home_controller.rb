class HomeController < ApplicationController
  def index

  end

  def mansplainr_response
    # response = Splainr::define(params[])
    # sender = params[:From]
    # friends = {
    #   "+14153334444" => "Curious George",
    #   "+14158157775" => "Boots",
    #   "+14155551234" => "Virgil"
    # }
    twiml = Twilio::TwiML::Response.new do |r|
      r.Message "Hello. Thanks for the message."
    end
    @response = twiml.text
  end
end
