class Recipe < ActiveRecord::Base

  belongs_to :chef

  validates :name, presence: true, length: { in: 5..100 }
  validates :summary, presence: true, length: { in: 10..150 }
  validates :description, presence: true, length: { in: 20..600 }

end
