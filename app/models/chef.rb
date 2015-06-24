class Chef < ActiveRecord::Base

  has_many :recipes
  has_many :likes

  has_secure_password

  before_save { self.email.downcase! }

  validates :name, presence: true, length: { in: 3..40 }

  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i  # Pragmatic, not exhaustive

  validates :email,
    presence: true,
    length: { maximum: 100 },
    format: { with: VALID_EMAIL },
    uniqueness: { case_sensitive: false }
end
