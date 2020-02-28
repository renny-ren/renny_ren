class AddContactInfoToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :contact_info, :string
  end
end
