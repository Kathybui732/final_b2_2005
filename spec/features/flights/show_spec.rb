require "rails_helper"

RSpec.describe "Flights Show Page" do
  before :each do
    @airline = Airline.create(name: "Frontier")
    @flight_1 = @airline.flights.create(number: 727, date: "8/3/2020", time: "8:00AM", departure_city: "Denver", arrival_city: "Reno")
    @passenger_1 = Passenger.create(name: "Kathy", age: 27)
    @passenger_2 = Passenger.create(name: "Hannah", age: 25)
    @passenger_3 = Passenger.create(name: "George", age: 5)
    FlightPassenger.create(flight: @flight_1, passenger: @passenger_1)
    FlightPassenger.create(flight: @flight_1, passenger: @passenger_2)
    FlightPassenger.create(flight: @flight_1, passenger: @passenger_3)
  end

  it "displays all of flight's info" do
    visit "/flights/#{@flight_1.id}"
    expect(page).to have_content(@flight_1.number)
    expect(page).to have_content(@flight_1.date)
    expect(page).to have_content(@flight_1.time)
    expect(page).to have_content(@flight_1.departure_city)
    expect(page).to have_content(@flight_1.arrival_city)
  end

  it "displays the name of the airline the flight belongs to" do
    visit "/flights/#{@flight_1.id}"
    expect(page).to have_content(@airline.name)
  end

  it "displays names all of all the passengers on this flight" do
    visit "/flights/#{@flight_1.id}"
    expect(page).to have_content(@passenger_1.name)
    expect(page).to have_content(@passenger_2.name)
    expect(page).to have_content(@passenger_3.name)
  end

  it "displays the number of minors and adults on the flight" do
    visit "/flights/#{@flight_1.id}"
    expect(page).to have_content("Number of Adults on Flight: 2")
    expect(page).to have_content("Number of Minors on Flight: 1")
  end
end
