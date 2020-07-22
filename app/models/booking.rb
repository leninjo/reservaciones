class Booking < ApplicationRecord
  validates :nombre, :telefono, :fecha, :hora, presence: true
  validates :fecha, uniqueness: { scope: :hora, 
    message: "u hora no disponibles!" } 
  validates :telefono, :length => { :is => 8, 
    message: " debe tener 8 digitos."} 

  # busquedas 
  def self.search(search)
    if search 
      where(["fecha = ?", "#{search}"])
    else
      Booking.all 
    end 
  end     

  def self.searchr(s,e)
    where("fecha BETWEEN ? AND ?", s, e)
  end 
  #busquedas 

  #dia con mas partidos 
  def self.dia 
    dias = group(:fecha).count(:fecha)
    dias.values.max
  end 

  #record reservaciones 
  def self.dia_max 
    dias = group(:fecha).count(:fecha)
    dias.max_by{|k,v| v}[0]
  end 

  #hora mas reservada
  def self.hora_pref
    horas =  group(:hora).count(:hora)
    horas.max_by{|k,v| v}[0]
  end 

  #partidos para el dia actual 
  def self.reservas_hoy
    where("fecha = ?", Date.today).count
  end 

  #ultimos 7 dias 
  def self.reservas_l
    where("fecha > ?", Date.today-7.days).count
  end 

  #proximos 7 dias 
  def self.reservas_n
    where("fecha BETWEEN ? AND ?", Date.today, Date.today+7.days).count
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
