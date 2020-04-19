class CreateChangelogs < ActiveRecord::Migration[5.0]
  def change
    create_table :changelogs do |t|
      t.string :content
      t.string :version

      t.timestamps
    end
  end
end
