class AddFoodRefToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :recipe_foods, :food, null: false, foreign_key: {to_table: :foods}
  end
end
