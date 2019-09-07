require_relative 'hotel'

describe "room number" do
    before do
        @hotel = HotelBooking::Hotel.new(id: 1)
    it "check if the room class is an array" do
        expect(Hotel )