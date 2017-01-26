class ArchivesController < ApplicationController
  def index
    session[:admin] = false
    @articles = Article.all
  end
end
