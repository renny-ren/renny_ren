class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def create
    Tag.create!(tag_name: params[:tag_name])
    redirect_to tags_path
  end

  def show
    tag = Tag.find_by(tag_name: params[:tag_name])
    @articles = Article.find_article_by_tag(tag).paginate(page: params[:page], per_page: 8)
  end

  def destroy
    tag = Tag.find_by(tag_name: params[:tag_name])
    tag.destroy
    redirect_to tags_path
  end
end
