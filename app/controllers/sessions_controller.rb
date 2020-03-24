class SessionsController < ApplicationController
  def index; end

  def create
    session[:hahaha] = params[:admin_token]
    redirect_to articles_path
  end

  def destroy
    session.delete(:hahaha)
    redirect_to articles_path
  end
end
