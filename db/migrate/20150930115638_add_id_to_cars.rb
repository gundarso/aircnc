class AddIdToCars < ActiveRecord::Migration
  def change
    add_reference :cars, :category, index: true, foreign_key: true
  end
end
