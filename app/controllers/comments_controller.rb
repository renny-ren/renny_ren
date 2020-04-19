class CommentsController < ApplicationController
  def create
    if comment_params[:body].blank?
      @has_error = true
    else
      if params[:article_id].present?
        @owner = Article.find(params[:article_id])
      elsif params[:video_id].present?
        @owner = Video.find(params[:video_id])
      end
      @comment = @owner.comments.create(comment_params)
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
