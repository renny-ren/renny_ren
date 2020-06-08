class ArticlesController < ApplicationController
  load_and_authorize_resource

  def index
    @articles = @articles.tagged_with(params[:filters]) if params[:filters].present?
    @articles = @articles.order('created_at DESC').paginate(page: params[:page], per_page: 10)
  end

  def new
    @article = Article.new
  end

  def create
    Article.create!(article_params)
    redirect_to articles_path
  end

  def show
    @article.view_times.incr(1)
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :tag_list)
  end
end
