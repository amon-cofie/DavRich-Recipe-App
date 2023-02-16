class Food < ApplicationRecord
  has_many :recipe_foods
  belongs_to :user

  validates :name, presence: true
  validates :price, presence: true, comparison: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, comparison: { greater_than_or_equal_to: 0 }
  validates :measurement_unit, presence: true
end
