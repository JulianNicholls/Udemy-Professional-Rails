# Model for many-to-many recipe style association
class RecipeStyle < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :style
end
