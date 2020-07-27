class StatisticsController < ApplicationController 
  before_action :authenticate_user!

  def index 
    @reservas = Booking.all 
  end 
end 