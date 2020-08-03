require "rails_helper"

RSpec.describe "Passenger Show Page" do
  before :each do
    @airline = Airline.create(name: "Frontier")
    @passenger_1 = Passenger.create(name: "Kathy", age: 27)
    @flight_1 = @airline.flights.create(number: 727, date: "8/3/2020", time: "8:00AM", departure_city: "Denver", arrival_city: "Reno")
    @flight_2 = @airline.flights.create(number: 782, date: "7/3/2020", time: "3:00PM", departure_city: "Denver", arrival_city: "San Jose")
    FlightPassenger.create(flight: @flight_1, passenger: @passenger_1)
    FlightPassenger.create(flight: @flight_2, passenger: @passenger_1)
  end

  it "displays passenger info" do
    visit "/passengers/#{@passenger_1.id}"
    expect(page).to have_content(@passenger_1.name)
  end

  it "displays all flights associated with passenger" do
    visit "/passengers/#{@passenger_1.id}"
    expect(page).to have_link(@flight_1.number)
    expect(page).to have_link(@flight_2.number)
    click_on @flight_1.number
    expect(current_path).to eq("/flights/#{@flight_1.id}")
  end
end
