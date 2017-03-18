class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'name', password: 'password', except: [:index, :show]
  before_action :validate_admin, except: [:index, :show]

  def index
    # filter = HTML::Pipeline::SyntaxHighlightFilter.new("<p><code>ruby asdlkfj</code></p>")
    # @b = Pygments.styles
    # @b = Pygments.css('.highlight')
    # @articles = Article.all
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
    @article = Article.find(params[:id])
    @tag_arr = format_array(@article.tag)
    get_date
  end

  def edit
    @article = Article.find(params[:id])
    @tags = Tag.all
  end

  def update
    @article = Article.find(params[:id])
    @article.content = Article.to_html(article_params[:content_md])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to archives_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content_md, :tag)
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
end
