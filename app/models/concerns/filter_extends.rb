module FilterExtends
  extend ActiveSupport::Concern
  class_methods do
    def to_html(text)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      Nokogiri::HTML(markdown.render(text)).text
    end
  end
end