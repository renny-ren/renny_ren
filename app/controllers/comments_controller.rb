class CommentsController < ApplicationController
  http_basic_authenticate_with name: Settings.name, password: Settings.password, only: :destroy
  load_resource :article
  
  def create
    if comment_params[:body].blank?
      @has_error = true
    else
      @comment = @article.comments.create(comment_params)
    end
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
