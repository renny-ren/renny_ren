require 'aliyun/oss'

class UploadsController < ApplicationController
  def create
    ::UploadFileService.new("images/user/#{params[:upload].original_filename}", params[:upload].tempfile.path).call
    render plain: 'success', status: 200
  end
end
