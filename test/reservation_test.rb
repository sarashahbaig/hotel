require_relative "test_helper"

describe HotelBooking::Reservation do
  before do
    @duration = HotelBooking::Duration.new(
      start_date: "2019-09-01",
      end_date: "2019-09-04",
    )
    @cost = HotelBooking::Reservation.new(id: 1,
                                          customer_id: 2,
                                          room: 34,
                                          duration: @duration)
  end

  describe "cost" do
    it "cost must return an interger" do
      cost = @cost.get_total_cost()
      expect(cost).must_be_kind_of Numeric
    end
  end
  describe "cost" do
    it "cost per night must be 200" do
      cost = @cost.get_total_cost()
      nights = @duration.get_nights()
      expect(cost).must_equal nights * 200
    end
  end
end
