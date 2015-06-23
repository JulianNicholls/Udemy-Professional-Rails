class AddPictureToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :picture, :string
  end
end
