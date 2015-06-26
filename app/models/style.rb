class Style < ActiveRecord::Base
  has_many :recipe_styles
  has_many :recipes, through: :recipe_styles

  validates :name, presence: true, length: { in: 2..25 }
end
