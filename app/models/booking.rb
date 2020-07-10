class Booking < ApplicationRecord
  validates :nombre, :telefono, :fecha, :hora, presence: true

  validates :fecha, uniqueness: { scope: :hora, 
    message: "u hora no disponibles!" } 

  validates :telefono, :length => { :is => 8, 
    message: " debe tener 8 digitos."} 

  def self.search(search)
    if search 
      where(["fecha LIKE ?", "_#{search}_"])
    else
      all 
    end 
  end 
  
  before_save :pago_monto 

  def pago_monto
    if self.hora > 18 
      self.monto = 180
    else 
      self.monto = 150
    end 
  end 


end
