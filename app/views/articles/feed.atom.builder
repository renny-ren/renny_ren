atom_feed :language => 'en-US' do |feed|
  feed.title t(:title)
  feed.updated @updated
  feed.icon asset_url 'avatar.ico'
  feed.logo asset_url 'avatar-2.jpeg'

  @articles.each do |item|
    next if item.updated_at.blank?

    feed.entry(item) do |entry|
      entry.url article_url(item)
      entry.title item.title
      entry.content item.content, type: 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(item.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 

      entry.author do |author|
        author.name '任峻宏'
      end
    end
  end
end
