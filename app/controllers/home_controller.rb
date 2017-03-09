class HomeController < ApplicationController
  def index
    redirect_to locale: params[:set_locale] if params[:set_locale]
  end
end
