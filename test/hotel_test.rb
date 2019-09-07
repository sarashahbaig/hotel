require_relative "test_helper"

describe HotelBooking::Hotel do
  before do
    @hotel = HotelBooking::Hotel.new(id: 1, name: "My Test Hotel")
    @date = Date.parse("2020-08-04")
    @customer = HotelBooking::Customer.new(
      id: 1,
      name: "Customer name",
    )
  end
  describe "wave 1" do
    describe "rooms" do
      it "returns a list" do
        rooms = @hotel.rooms
        expect(rooms).must_be_kind_of Array
      end
    end
  end

  describe "get total_rooms" do
    it "returns the total number of rooms in the hotel" do
      total_rooms = @hotel.get_total_rooms()
      expect(total_rooms).must_equal 20
    end
  end

  describe "each room must of type Room" do
    it "rooms in the hotel should be of type room" do
      room_list = @hotel.rooms

      expect(room_list).must_be_kind_of Array
      room_list.each do |room|
        room.must_be_kind_of HotelBooking::Room
      end
    end
  end

  describe "reserve_room" do
    it "takes two Date objects and returns a Reservation" do
      start_date = @date
      end_date = start_date + 3

      # reservation = @hotel.reserve_room(start_date, end_date)

      # expect(reservation).must_be_kind_of HotelBooking::Reservation
    end
  end

  describe "add_customer" do
    it "checks the number of customers before and after" do
      customers_list = @hotel.customers
      expect(customers_list).must_be_kind_of Array
      expect(customers_list.length).must_equal 0

      @hotel.add_customer(@customer)
      expect(customers_list.length).must_equal 1
    end
  end

  describe "test make reservation" do
    it "test" do
      reservation_list = @hotel.reservations
      expect(reservation_list).must_be_kind_of Array
      expect(reservation_list.length).must_equal 0
      cust_id = @customer.id
      @hotel.make_reservation(cust_id, 10, "2019-09-05", "2019-09-05")
      expect(reservation_list.length).must_equal 1

      reser_customer_id = @hotel.reservations[0].customer_id
      # binding.pry

      expect(reser_customer_id).must_equal @customer.id
    end
  end
end
