class Quantity < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  validates :description, presence: true
end
