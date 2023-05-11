class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  helper_method :admin?

  include PermissionControl

  def page_not_found
    respond_to do |format|
      format.html { render file: "public/404.html", status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end

  def server_error
    respond_to do |format|
      format.html { render file: "public/500.html", status: 500 }
      format.all { render nothing: true, status: 500 }
    end
  end

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
end
