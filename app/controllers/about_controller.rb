class AboutController < ApplicationController
  def index
    @slides = Dir['public/carousel_images/*'].sort.map { |img| { src: "/carousel_images/#{File.basename(img)}" } }
  end
end
