class ArticlesController < ApplicationController
  load_and_authorize_resource except: :feed

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
    @comments = @article.comments.sorted
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

  def feed
    @articles = Article.order('created_at DESC')
    @updated = @articles.first.updated_at
    respond_to do |format|
      format.atom { render layout: false }
      format.rss { redirect_to feed_path(format: :atom), status: :moved_permanently }
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :tag_list)
  end
end
