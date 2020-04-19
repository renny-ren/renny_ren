class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.text :content
      t.string :description
      t.string :thumb_image_url

      t.timestamps
    end
  end
end
