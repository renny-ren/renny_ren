class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  after_action :return_errors, only: [:page_not_found, :server_error]

  helper_method :admin?

  include PermissionControl

  def page_not_found
    @status = 404
  end

  def server_error
    @status = 500
  end

  private

  def return_errors
    respond_to do |format|
      format.html { render file: "/public/#{@status}", status: @status }
      format.all { render nothing: true, status: @status }
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
