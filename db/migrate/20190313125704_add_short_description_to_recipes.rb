class AddShortDescriptionToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :short_description, :string
  end
end
