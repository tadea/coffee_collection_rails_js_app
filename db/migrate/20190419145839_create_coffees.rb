class CreateCoffees < ActiveRecord::Migration[5.2]
  def change
    create_table :coffees do |t|
      t.string :name
      t.text :description
      t.string :process
      t.string :grind
      t.string :origin

      t.timestamps
    end
  end
end
