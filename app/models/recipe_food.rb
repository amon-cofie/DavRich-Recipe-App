class RecipeFood < ApplicationRecord
  after_create :update_public_access
  belongs_to :foods
  belongs_to :recipes

  validates :quantity, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :public, presence: true
end
