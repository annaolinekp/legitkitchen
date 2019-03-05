class Recipe < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :cooktime, presence: true
  validates :preptime, presence: true
  validates :picture_url, presence: true
end
