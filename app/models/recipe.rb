class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :cooktime, presence: true
  validates :preptime, presence: true
  # validates :picture_url, presence: true

  include PgSearch
  pg_search_scope :search_by_name_and_description,
    against: [:name, :description],
    using: {
      tsearch: { prefix: true }
    }
end
