class Flight < ApplicationRecord
  validates_presence_of :date, :time, :departure_city, :arrival_city
  validates :number, uniqueness: true, presence: true

  belongs_to :airline
  has_many :flight_passengers
  has_many :passengers, through: :flight_passengers
end
