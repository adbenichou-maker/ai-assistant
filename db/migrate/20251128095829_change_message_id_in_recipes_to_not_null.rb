class ChangeMessageIdInRecipesToNotNull < ActiveRecord::Migration[7.1]
  def change
    change_column_null :recipes, :message_id, false
  end
end
