class Recipe < ApplicationRecord
  belongs_to :user
  attr_accessor :ingredients
  # validates :ingredients, presence: true, if: :amountsNotEmptyString?
  attr_accessor :amounts
  # validates :amounts, presence: true, if: :ingredientsNotEmptyString?
  has_many :comments
  has_many :quantities, dependent: :destroy
  has_many :saved_recipes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :category, presence: true
  validates :cooktime, presence: true
  validates :preptime, presence: true
  # validates :picture_url, presence: true

  # def amountsNotEmptyString?
  #   raise
  #   amounts != nil ? true : false
  # end

  # def ingredientsNotEmptyString?
  #   ingredients != nil ? true : false
  # end

  mount_uploader :picture_url, PhotoUploader
  validates :dietary_requirements, presence: true
  include Filterable
  scope :dietary_requirements, -> (dietary_requirements) { where dietary_requirements: dietary_requirements }
  scope :category, -> (category) { where category: category }
  # scope :size, -> (size) { where size: size }
  include PgSearch
  pg_search_scope :search_by_name_and_description,
    against: [:name, :description],
    using: {
      tsearch: { prefix: true }
    }
end
