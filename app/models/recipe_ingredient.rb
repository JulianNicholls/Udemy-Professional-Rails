# Model for many-to-many recipe ingredient association
class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
end
