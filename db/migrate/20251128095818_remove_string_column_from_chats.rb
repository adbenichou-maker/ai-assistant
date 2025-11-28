class RemoveStringColumnFromChats < ActiveRecord::Migration[7.1]
  def change
    remove_column :chats, :string, :string
  end
end
