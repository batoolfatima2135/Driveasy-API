class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.decimal :price
      t.string :color
      t.string :model
      t.string :image

      t.timestamps
    end
  end
end
