class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :prep_time
      t.integer :cooking_time
      t.string :ingredients
      t.text :description
      t.text :steps

      t.timestamps
    end
  end
end
