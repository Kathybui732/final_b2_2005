class Passenger < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age

  has_many :flight_passengers
  has_many :flights, through: :flight_passengers
end
