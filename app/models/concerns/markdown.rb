module Markdown
  class << self
    def to_html(text)
      markdown = Redcarpet::Markdown.new(renderer, extensions = {})
      markdown.render(text)
    end
  end
end