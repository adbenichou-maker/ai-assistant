class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :prep_time
      t.integer :cooking_time
      t.jsonb :ingredients, default: {}
      t.jsonb :steps, default: []

      t.text :description

      t.timestamps
    end
  end
end
