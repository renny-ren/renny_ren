class HomeController < ApplicationController
  def index
    @messages = Message.order('id DESC')
    @timeline_items = TimelineItem.includes(:owner).order(created_at: :desc).paginate(page: params[:page])
    redirect_to locale: params[:set_locale] if params[:set_locale]

    respond_to do |format|
      format.html
      format.js
    end
  end
end
