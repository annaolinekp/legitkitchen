class Quantity < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  validates :description, presence: true
  # accepts_nested_attributes_for :ingredient
end
