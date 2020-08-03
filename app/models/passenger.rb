class Passenger < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age

  has_many :flight_passengers
  has_many :flights, through: :flight_passengers

  def self.number_of_adults
    Passenger.where('age >= ?', 18).count
  end

  def self.number_of_minors
    Passenger.where('age < ?', 18).count
  end
end
