class UploadFileService
  attr_reader :filename, :file_path

  def initialize(filename, file_path)
    @filename = filename
    @file_path = file_path
  end

  def call
    bucket = oss_client.get_bucket('renny-assets')
    bucket.put_object(filename, file: file_path)
  end

  private

  def oss_client
    @client ||= Aliyun::OSS::Client.new(
      endpoint: Settings.oss_assets_endpoint,
      access_key_id: Settings.aliyun_access_key_id,
      access_key_secret: Settings.aliyun_access_key_secret
    )
  end
end
