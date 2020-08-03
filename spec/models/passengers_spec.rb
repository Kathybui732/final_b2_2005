require "rails_helper"

RSpec.describe Passenger, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe "relationships" do
    it { should have_many :flight_passengers }
    it { should have_many(:flights).through(:flight_passengers) }
  end

  describe "methods" do
    before :each do
      @passenger_1 = Passenger.create(name: "Kathy", age: 27)
      @passenger_2 = Passenger.create(name: "Hannah", age: 25)
      @passenger_3 = Passenger.create(name: "George", age: 5)
    end
    it "#number_of_adults" do
      expect(Passenger.number_of_adults).to eq(2)
    end

    it "#number_of_minors" do
      expect(Passenger.number_of_minors).to eq(1)
    end
  end
end
