class AgregarCompletado < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :completado, :boolean, null: false, default: true
  end
end
