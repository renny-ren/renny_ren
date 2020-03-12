class CreateTimelineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :timeline_items do |t|
      t.string :title
      t.text :content
      t.string :description
      t.integer :owner_id
      t.string :owner_type

      t.index [:owner_id, :owner_type]

      t.timestamps
    end
  end
end
