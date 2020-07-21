class StatisticsController < ApplicationController 
  def index 
    @reservas = Booking.all 
  end 
end 