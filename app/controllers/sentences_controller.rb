class SentencesController < ApplicationController
  load_and_authorize_resource

  def new 
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new(sentence_params)
    @sentence.save
    redirect_to home_path
  end

  def edit
  end

  def index
    @sentences = Sentence.paginate(page: params[:page]).order('created_at DESC')
  end

  def update
    redirect_to home_path if @sentence.update(sentence_params)
  end

  def destroy
    @sentence.destroy
    redirect_to home_path
  end

  private

  def sentence_params
    params.require(:sentence).permit(:content, :source)
  end
end
