class Like < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe

  # Ensure Chef can only vote on a recipe once
  validates_uniqueness_of :chef, scope: :recipe
end
