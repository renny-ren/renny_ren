class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      t.references :owner, polymorphic: true, index: true

      t.timestamps
    end
  end
end
