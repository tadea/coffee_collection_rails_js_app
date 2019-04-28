class ChangeOriginToBeStringInCoffees < ActiveRecord::Migration[5.2]
  def change
    change_column :coffees, :origin, :string
  end
end
