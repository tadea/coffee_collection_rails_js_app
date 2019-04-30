class ChangeGrindIdToBeIntegerInCoffees < ActiveRecord::Migration[5.2]
  def change
    change_column :coffees, :grind_id, :integer
  end
end
