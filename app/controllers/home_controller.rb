class HomeController < ApplicationController
  def index

  end

  def mansplainr_response
    SplainrWorker.new.perform(params[:From], params[:Body])

    respond_to do |format|
      format.xml { render xml: { success: true } }
    end
  end
end
