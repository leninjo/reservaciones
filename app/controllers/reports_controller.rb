class ReportsController < ApplicationController 
  def index 
    @reservas = Booking.all 
  end 
  
end 