class VideosController < ApplicationController
  load_and_authorize_resource

  def index
    @videos = @videos.includes(:comments, :tags)
    @videos = @videos.tagged_with(params[:type]) if params[:type].present? && params[:type] != 'all'
    @videos = @videos.search_filter(params[:query]) if params[:query].present?
    @videos = @videos.order('created_at DESC')
  end

  def show
    @video.view_times.incr(1)
    @comments = @video.comments.sorted
  end

  def edit
  end

  def new
  end

  def create
    Video.create!(video_params)
    redirect_to videos_path
  end

  def update
    if @video.update(video_params)
      redirect_to video_path(@video)
    else
      render 'edit'
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path
  end

  private

  def video_params
    params.require(:video).permit(:title, :content, :description, :thumb_image_url, :tag_list)
  end
end