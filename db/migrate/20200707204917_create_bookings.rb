class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :nombre
      t.integer :telefono
      t.date :fecha
      t.integer :hora

      t.timestamps
    end
  end
end
