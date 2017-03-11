module FilterExtends
  extend ActiveSupport::Concern
  class_methods do
    def to_html(text)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      markdown.render(text)
    end
  end
end
