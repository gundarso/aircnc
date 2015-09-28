class AddCityToCars < ActiveRecord::Migration
  def change
    add_column :cars, :city, :string
  end
end
