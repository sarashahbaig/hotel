require_relative "test_helper"

describe HotelBooking::Duration do
  describe "duration test" do
    it "raise exception when an invalid date range is provided" do
      expect {
        HotelBooking::Duration.new(
          start_date: "2019-02-01",
          end_date: "2019-01-01",
        )
      }.must_raise ArgumentError
    end
  end
  describe "" do
    before do
      @duration = HotelBooking::Duration.new(
        start_date: "2019-09-01",
        end_date: "2019-09-05",
      )
    end

    it "get nights" do
      start_date = Date.new(2019, 9, 1)
      end_date = Date.new(2019, 9, 5)
      count = (start_date...end_date).count
      night_count = @duration.get_nights()
      expect(night_count).must_equal count
    end
  end
end
# describe "cost" do
#     it "a"
