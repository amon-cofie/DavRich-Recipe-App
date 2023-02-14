class Food < ApplicationRecord
  has_many :recipe_foods
  belongs_to :users

  validates :name, presence: true
  validates :price, presence: true, comparison: { greater_than_or_equal_to: 0 }
  validates :quantity, presence: true, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
end
