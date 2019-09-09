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
    describe "room list" do
      it "access the list of all of the rooms in the hotel" do
        room_list = @hotel.rooms
        expect(room_list).must_be_kind_of Array
      end
      it "get the total number of rooms in the hotel" do
        total_rooms = @hotel.get_total_rooms()
        expect(total_rooms).must_equal 20
      end

      it "rooms in the hotel should be of type room" do
        room_list = @hotel.rooms
        room_list.each do |room|
          room.must_be_kind_of HotelBooking::Room
        end
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
  end

  describe "test list of reservations" do
    before do
      @reservation_list = @hotel.reservations
    end
    it "reservation should be a list" do
      expect(@reservation_list).must_be_kind_of Array
      expect(@reservation_list.length).must_equal 0
    end
    describe "make reservation" do
      it "make a reservation of a room for a given date range" do
        cust_id = @customer.id
        @hotel.make_reservation(cust_id, "2019-09-01", "2019-09-05")
        expect(@reservation_list.length).must_equal 1
      end
    end

    describe "get reservation" do
      before do
        cust_id = @customer.id
        @hotel.make_reservation(cust_id, "2019-01-01", "2019-01-05")
        @hotel.make_reservation(cust_id, "2019-02-01", "2019-02-05")
        @hotel.make_reservation(cust_id, "2019-03-01", "2019-03-05")
        @hotel.make_reservation(cust_id, "2019-04-01", "2019-04-05")
      end
      it "access the list of reservations for a specific date, so that I can track reservations by date" do
        date = Date.new(2019, 3, 2)
        res_list = @hotel.get_reservation(date)
        expect(res_list).must_be_kind_of Array
        expect(res_list.length).must_equal 1
      end
    end

    it "get the total cost for a given reservation" do
      cust_id = @customer.id
      @hotel.make_reservation(cust_id, "2019-09-01", "2019-09-05")
      @hotel.make_reservation(cust_id, "2019-09-01", "2019-09-05")
      reservation_list = @hotel.reservations
      expect(reservation_list).must_be_kind_of Array

      total_cost = @hotel.get_reservation_cost(0)
      expect(total_cost).must_equal 800
    end
  end
end
