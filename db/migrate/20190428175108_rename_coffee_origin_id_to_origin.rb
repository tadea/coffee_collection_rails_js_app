class RenameCoffeeOriginIdToOrigin < ActiveRecord::Migration[5.2]
  def change
    rename_column :coffees, :origin_id, :origin
  end
end
