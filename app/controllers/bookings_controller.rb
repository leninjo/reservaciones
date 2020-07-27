class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :index]
  
  def index 
    @reservas = Booking.search(params[:search]).order("fecha DESC").paginate(page: params[:page], per_page: 6)
  end  

  def verificar 
    verf = Booking.where("fecha = ? and hora = ?", params[:fecha], params[:hora]).empty?
    if verf == true 
      redirect_to root_path
      flash[:notice] = "¡DISPONIBLE!"
    else
      redirect_to root_path
      flash[:notice] = "Lo sentimos, no esta disponible..."
    end  
  end 

  #crear 
  def new 
    @reserva = Booking.new 
  end 

  def create 
    @reserva = Booking.create(booking_params)
    if @reserva.save  
      flash[:notice] = "¡Reservación exitosa! Total a cancelar Q#{@reserva.monto}"
      redirect_to root_path
    else
        flash.now[:notice] = @reserva.errors.full_messages[0]
        render 'new'
    end  
  end 

  #actualizar 
  def edit 
  end 

  def update 
    if @reserva.update(booking_params)
      flash[:notice] = "¡Reservación actualizada!"
      redirect_to bookings_path
    else
      flash.now[:notice] = @reserva.errors.full_messages[0]
      render 'edit'
    end 
  end 

  #eliminar 
  def destroy 
    @reserva.destroy 
    redirect_to bookings_path
  end 

  private 
  def booking_params
      params.require(:booking).permit(:nombre, :telefono, :fecha, :hora, :completado, :monto)      
  end

  def set_booking
      @reserva = Booking.find(params[:id])
  end

end 