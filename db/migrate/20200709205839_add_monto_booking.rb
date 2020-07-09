class AddMontoBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :monto, :integer
  end
end
