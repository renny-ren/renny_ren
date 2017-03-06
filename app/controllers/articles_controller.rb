class ArticlesController < ApplicationController
  http_basic_authenticate_with name: 'allen', password: '123', except: [:index, :show]

  def new
    @article = Article.new
    @tags = Tag.all
  end

  def create
    p params[:tag]

    content = Article.to_html(article_params[:content_md])
    Article.create!(title: article_params[:title], content: content, content_md: article_params[:content_md], 
                    date: Article.year_month, tag: article_params[:tag])
    redirect_to articles_path
  end

  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
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

  def index
    # filter = HTML::Pipeline::SyntaxHighlightFilter.new("<p><code>ruby asdlkfj</code></p>")
    # @b = Pygments.styles
    # @b = Pygments.css('.highlight')
    # @articles = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content_md, :tag)
  end
end
