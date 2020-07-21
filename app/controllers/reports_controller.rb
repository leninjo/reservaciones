class ReportsController < ApplicationController 
  
  def index 
    s = params[:s]
    e = params[:e]
    @reservas = Booking.where("DATE(fecha) BETWEEN ? AND ?", s, e)
  end 
  
end 