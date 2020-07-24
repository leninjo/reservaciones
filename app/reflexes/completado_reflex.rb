class CompletadoReflex < ApplicationReflex
  def complet 
    reserva = Booking.find(element.dataset[:id])
    if reserva.completado == false
      reserva.update(completado: true)
    else
      reserva.update(completado: false)
    end 
  end 
end 