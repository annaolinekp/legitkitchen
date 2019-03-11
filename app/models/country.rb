class Country < ApplicationRecord
  has_many :users
  has_many :recipes, through: :users
  validates :name, presence: true
end
