class CommentsController < ApplicationController
  load_and_authorize_resource only: :destroy

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
    @comment.destroy
    redirect_to @comment.owner
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
