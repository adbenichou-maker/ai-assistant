class ChangeRecipe < ActiveRecord::Migration[7.1]
  def change
    remove_column :recipes, :prep_time, :integer
  end
end
