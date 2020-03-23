class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  protected

  def current_ability
    @current_ability ||= Ability.new(session[:hahaha])
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  
  def validate_admin
    if session[:admin]
      "pass"
    else
      render plain: '401 Unauthorized', status: 401
    end
  end
end
