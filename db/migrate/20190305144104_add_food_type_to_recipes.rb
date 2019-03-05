class AddFoodTypeToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :food_type, :string
  end
end
