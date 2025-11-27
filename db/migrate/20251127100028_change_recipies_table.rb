class ChangeRecipiesTable < ActiveRecord::Migration[7.1]
  def change

    add_column :recipes, :content, :text


    Recipe.reset_column_information

    Recipe.where(content: nil).update_all(content: "## Placeholder Recipe Content\n\nPlease re-seed the database to generate full content.")

    change_column_null :recipes, :content, false



    remove_column :recipes, :cooking_time, :integer if column_exists?(:recipes, :cooking_time)
    remove_column :recipes, :ingredients, :jsonb if column_exists?(:recipes, :ingredients)
    remove_column :recipes, :steps, :jsonb if column_exists?(:recipes, :steps)
    remove_column :recipes, :description, :text if column_exists?(:recipes, :description)
    add_reference :recipes, :user, null: false, foreign_key: true

  end
end
