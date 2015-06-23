class Like < ActiveRecord::Base

  belongs_to :chef
  belongs_to :recipe

  validates_uniqueness_of :chef, scope: :recipe   # Chef can only vote on a recipe once
end
