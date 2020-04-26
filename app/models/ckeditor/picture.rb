class Ckeditor::Picture < Ckeditor::Asset
  self.inheritance_column = nil

  has_attached_file :data,
                    url: "#{Settings.cdn_host}/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    path: ':rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension',
                    styles: { content: '800>', thumb: '118x100#' }

  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 10.megabytes
  validates_attachment_content_type :data, content_type: /\Aimage/

  def url_content
    url(:content)
  end
end
