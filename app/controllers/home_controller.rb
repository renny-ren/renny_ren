class HomeController < ApplicationController
  def index
    @messages = Message.order('id DESC')
    @sentence = Sentence.last
    @timeline_items = TimelineItem.all.paginate(page: 1, per_page: 10)
    redirect_to locale: params[:set_locale] if params[:set_locale]
  end
end
