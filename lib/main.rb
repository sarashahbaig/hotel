require "pry"
require_relative "hotel"
require_relative "customer"

module HotelBooking
  def HotelBooking.main
    # create a hotel instance
    hotel = Hotel.new(id: 1, name: "My Hotel")

    # check what our hotel looks
    customer_1 = Customer.new(
      id: 1, name: "One",
    )

    hotel.add_customer(customer_1)

    hotel.make_reservation(1, 10, "2019-9-3", "2019-9-15")

    # binding.pry
  end
end

HotelBooking.main
