class CreateCoffees < ActiveRecord::Migration[5.2]
  def change
    create_table :coffees do |t|
      t.string :name
      t.text :description
      t.string :process
      t.string :grind
      t.integer :origin_id

      t.timestamps
    end
  end
end
