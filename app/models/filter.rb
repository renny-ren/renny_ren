class Filter < ApplicationRecord
  class << self
    def self.to_html(text)
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      markdown.render(text)
    end
  end
end