# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airline = Airline.create(name: "Frontier")

flight_1 = airline.flights.create(number: 727, date: "8/3/2020", time: "8:00AM", departure_city: "Denver", arrival_city: "Reno")
flight_2 = airline.flights.create(number: 782, date: "7/3/2020", time: "3:00PM", departure_city: "Denver", arrival_city: "San Jose")

passenger_1 = Passenger.create(name: "Kathy", age: 27)
passenger_2 = Passenger.create(name: "Hannah", age: 25)
passenger_3 = Passenger.create(name: "George", age: 5)

FlightPassenger.create(flight: flight_1, passenger: passenger_1)
FlightPassenger.create(flight: flight_1, passenger: passenger_2)
FlightPassenger.create(flight: flight_1, passenger: passenger_3)
FlightPassenger.create(flight: flight_2, passenger: passenger_1)
FlightPassenger.create(flight: flight_2, passenger: passenger_2)
