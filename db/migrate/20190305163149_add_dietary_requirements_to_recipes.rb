class AddDietaryRequirementsToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :dietary_requirements, :string
  end
end
