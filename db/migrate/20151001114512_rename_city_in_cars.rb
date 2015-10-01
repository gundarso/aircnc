class RenameCityInCars < ActiveRecord::Migration
  def change
    rename_column :cars, :city, :pickup_address
  end
end
