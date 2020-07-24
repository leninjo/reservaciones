class ReportsController < ApplicationController 
  
  def index 
    @reservas = Booking.searchr(params[:s], params[:e]).order("fecha DESC").paginate(page: params[:page], per_page: 5) 
  end 
  
end 