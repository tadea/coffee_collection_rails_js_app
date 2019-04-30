class CreateGrinds < ActiveRecord::Migration[5.2]
  def change
    create_table :grinds do |t|
      t.string :name

      t.timestamps
    end
  end
end
