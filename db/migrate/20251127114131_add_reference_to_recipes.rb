class AddReferenceToRecipes < ActiveRecord::Migration[7.1]
  def change
    add_column :recipes, :comment, :string
    add_reference :recipes, :messages, foreign_key: true
  end
end
