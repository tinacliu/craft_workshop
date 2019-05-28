class BookingsController < ApplicationController
  before_action :set_workshop, only: :create

  # placeholder, this will be on workshop show page
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.workshop = @workshop
    @booking.user = current_user
    if @booking.save
      redirect_to workshop_path(@workshop)
    else
      render :new
    end
  end

  private

  def set_workshop
    @workshop = Workshop.find(params[:workshop_id])
  end

  def booking_params
    params.require(:booking).permit(:num_guests)
  end
end
