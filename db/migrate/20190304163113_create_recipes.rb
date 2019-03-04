class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :category
      t.references :user, foreign_key: true
      t.integer :cooktime
      t.integer :preptime
      t.string :picture_url
      t.string :video_url

      t.timestamps
    end
  end
end
