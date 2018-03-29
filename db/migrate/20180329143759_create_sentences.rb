class CreateSentences < ActiveRecord::Migration[5.0]
  def change
    create_table :sentences do |t|
      t.string :content
      t.string :source
      
      t.timestamps
    end
  end
end
