class RemoveFoodTypeFromRecipes < ActiveRecord::Migration[5.2]
  def change
      remove_column :recipes, :food_type, :string
  end
end
