class ArticlesController < ApplicationController
  http_basic_authenticate_with name: Settings.name, password: Settings.password, except: [:index, :show]
  before_action :validate_admin, except: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
    @article = Article.new
    @tags = Tag.all
  end

  def create
    content = Article.to_html(article_params[:content_md])
    Article.create!(title: article_params[:title], content: content, content_md: article_params[:content_md],
                    date: Article.year_month, tag: article_params[:tag])
    redirect_to articles_path
  end

  def show
    @tag_arr = format_array(@article.tag)
    get_date
  end

  def edit
    @tags = Tag.all
  end

  def update
    @article.content = Article.to_html(article_params[:content_md])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to archives_path
  end

  def get_date
    @created_date = @article.created_at.to_date
    @updated_date = @article.updated_at.to_date
  end

  def format_array(string)
    arr = string.split('^^')
    arr.shift
    arr
  end

  def validate_admin
    if session[:admin]
      "pass"
    else
      render plain: '401 Unauthorized', status: 401
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content_md, :tag)
  end
end
