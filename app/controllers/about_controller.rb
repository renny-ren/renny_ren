class AboutController < ApplicationController
  def index
    @slides = Dir['public/carousel_images/*'].sort.map { |img| { src: "#{Settings.cdn_host}/carousel_images/#{File.basename(img)}" } }
  end
end
