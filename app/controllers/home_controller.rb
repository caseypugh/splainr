class HomeController < ApplicationController
  def index

  end

  def mansplainr_response
    SplainrWorker.new.perform(params[:From], params[:Body])

    respond_to do |format|
      format.xml 
    end
  end

  def mansplainr_call
    @say = Dictionary::DB.reject{|item| item[:phone].blank?}.first[:definition]
    respond_to do |format|
      format.xml 
    end
  end
end
