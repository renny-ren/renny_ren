class AboutController < ApplicationController
  def index
    @slides = Dir['public/carousel_images/*'].sort.map { |img| { src: "/#{File.basename(img)}" } }
  end
end
