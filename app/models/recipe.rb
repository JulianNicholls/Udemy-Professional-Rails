class Recipe < ActiveRecord::Base
  belongs_to :chef

  has_many :likes, dependent: :destroy

  has_many :recipe_styles, dependent: :destroy
  has_many :styles, through: :recipe_styles

  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  validates :chef_id, presence: true
  validates :name, presence: true, length: { in: 5..100 }
  validates :summary, presence: true, length: { in: 10..150 }
  validates :description, presence: true, length: { in: 20..600 }

  mount_uploader :picture, PictureUploader
  validate :picture_size

  default_scope -> { order(updated_at: :desc) }

  def thumbs_up
    likes.where(like: true).size
  end

  def thumbs_down
    likes.where(like: false).size
  end

  private

    def picture_size
      return unless picture.size > 5.megabytes

      errors.add :picture, 'The picture should be smaller than 5MB'
    end
end
