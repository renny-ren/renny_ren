class ArchivesController < ApplicationController
  def index
    @articles = Article.all
  end
end
