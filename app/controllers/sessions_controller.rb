class SessionsController < ApplicationController
  def index; end

  def create
    session[:admin] = true if params[:password] == Settings.sessions.password
    redirect_to archives_path
  end

  def destroy
    session.delete(:admin)
    redirect_to archives_path
  end
end
