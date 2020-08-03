class FlightPassengersController < ApplicationController

  def create
    flight = Flight.where(number: params[:number]).first
    fp = FlightPassenger.where(flight: flight, passenger_id: params[:passenger_id]).first
    if flight.nil?
      flash[:error] = "The flight number you entered does not exist"
    elsif fp.nil? && Flight.exists?(flight.id)
      FlightPassenger.create(flight: flight, passenger_id: params[:passenger_id])
    elsif FlightPassenger.exists?(fp.id)
      flash[:error] = "Passenger is already on this flight"
    end
    redirect_to "/passengers/#{params[:passenger_id]}"
  end
end
