class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def create
    Tag.create!(tag_name: params[:tag_name])
    redirect_to tags_path
  end

  def show
    tag = Tag.find(params[:tag_name])
    @articles = [] << Article.find_by(tag: tag)
  end
end
