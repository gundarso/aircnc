class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :type
      t.date :year
      t.integer :mileage
      t.string :fuel
      t.integer :seats

      t.timestamps null: false
    end
  end
end
