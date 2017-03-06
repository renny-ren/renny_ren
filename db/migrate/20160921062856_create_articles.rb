class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.text :content_md
      t.string :date
      t.string :tag
      
      t.timestamps
    end
  end
end
