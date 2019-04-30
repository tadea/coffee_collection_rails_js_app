class RenameCoffeeGrindToGrindId < ActiveRecord::Migration[5.2]
  def change
    rename_column :coffees, :grind, :grind_id

  end
end
