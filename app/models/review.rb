# Model for recipe review
class Review < ActiveRecord::Base
  belongs_to :chef
  belongs_to :recipe

  validates :body, presence: true, length: { minimum: 20 } # Short, meaningful
  validates :rating, inclusion: { in: 1..5 }

  # Ensure Chef can only write one review on a recipe.
  validates_uniqueness_of :chef, scope: :recipe

  default_scope -> { order(updated_at: :desc) }
end
