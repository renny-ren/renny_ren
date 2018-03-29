class HomeController < ApplicationController
  def index
    @messages = Message.all
    @sentence = Sentence.last
    redirect_to locale: params[:set_locale] if params[:set_locale]
  end
end
