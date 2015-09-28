class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.datetime :checkin
      t.datetime :checkout
      t.integer :rating
      t.references :renter, index: true, foreign_key: true
      t.references :car, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
