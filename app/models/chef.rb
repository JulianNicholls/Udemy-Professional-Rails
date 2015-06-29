class Chef < ActiveRecord::Base
  has_many :recipes
  has_many :likes
  has_many :reviews

  has_secure_password

  before_save { email.downcase! }

  validates :name, presence: true, length: { in: 3..40 }

  # Pragmatic, not exhaustive
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 100 },
                    format: { with: VALID_EMAIL },
                    uniqueness: { case_sensitive: false }
end
