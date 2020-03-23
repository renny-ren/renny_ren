class ArticlesController < ApplicationController
  # http_basic_authenticate_with name: Settings.name, password: Settings.password, except: [:index, :show]
  before_action :validate_admin, except: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 10).order('created_at DESC')
  end

  def new
    @article = Article.new
    @tags = Tag.all
  end

  def create
    Article.create!(article_params)
    redirect_to articles_path
  end

  def show
    # @tag_arr = format_array(@article.tag)
    get_date
  end

  def edit
    @tags = Tag.all
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

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
