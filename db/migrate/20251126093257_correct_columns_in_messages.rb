class CorrectColumnsInMessages < ActiveRecord::Migration[7.1]
  def change
    rename_column :messages, :message, :content

    remove_column :messages, :string, :string
    remove_column :messages, :text, :string
  end
end
