class HomeController < ApplicationController
  def index
    @messages = Message.order('id DESC')
    @sentence = Sentence.last
    redirect_to locale: params[:set_locale] if params[:set_locale]
  end
end
