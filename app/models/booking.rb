class Booking < ApplicationRecord
  validates :nombre, :telefono, :fecha, :hora, presence: true

  validates :fecha, uniqueness: { scope: :hora, 
    message: "u hora no disponibles!" } 

  validates :telefono, :length => { :is => 8, 
    message: " debe tener 8 digitos."} 
end
