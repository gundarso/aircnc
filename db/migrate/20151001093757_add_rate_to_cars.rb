class AddRateToCars < ActiveRecord::Migration
  def change
    add_column :cars, :rate, :decimal, precision: 7, scale: 2
  end
end
