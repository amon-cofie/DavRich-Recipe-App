class RecipeFood < ApplicationRecord
  belongs_to :foods
  belongs_to :recipes

  validates :quantity, numericality: {only_integer: true}, comparison: { greater_than_or_equal_to: 0 }
end
