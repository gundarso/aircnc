class DeleteTypeFromCars < ActiveRecord::Migration
  def change
    remove_column :cars, :type
  end
end
