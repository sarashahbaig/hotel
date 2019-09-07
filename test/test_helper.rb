

# Add simplecov
require "Date"
require "minitest"
require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# require_relative your lib files here!
require_relative "../lib/hotel"

describe "Test Hotel Class" do
  before do
    @hotel = HotelBooking::Hotel.new(id: 1)
  end
  it "access the list of all of the rooms in the hotel" do
    total_rooms = @hotel.get_total_rooms()
    expect(total_rooms).must_equal 20
  end

  it "get a reservation of a room for a given date range" do
    reservation = @reservation.get_reservation()
    expect(reservation).
      end

    it "acces the list of reservations for a specific date" do
    end
  end

  describe "date range" do
    it "validates the start and end date" do
      start_day = Date.new(2001, 2, 3)
      end_day tomers = start_day
      expect {
        HotelBooking::DateRange.new(start_day, end_date)
      }.must_raise ArgumentError
    end
  end
end
