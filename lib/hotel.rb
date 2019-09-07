require_relative "room"
# require_relative "customer"
require_relative "duration"
require_relative "reservation"
require_relative "date_range"

module HotelBooking
  class Hotel
    TOTAL_ROOMS = 20
    attr_reader :id, :rooms, :reservations, :vacancy
    attr_accessor :customers

    def initialize(id:, name:)
      @id = id
      @name = name
      @rooms = []
      @reservations = []
      @customers = []
      @vacancy = true

      make_room
    end

    def make_room()
      TOTAL_ROOMS.times do |index|
        room = Room.new(id: index + 1, number: index + 1, availability: true, reservation: nil)
        @rooms << room
      end
    end

    def get_total_rooms()
      return @rooms.length
    end

    def add_customer(customer)
      # customer = Customer.new(id: 1, name: "one")
      @customers << customer
    end

    def find_customer(id)
      customer = @customers.find { |customer| customer.id == id }
      return customer
    end

    #list of rooms that are not reserverd
    def get_availbale_room()
    end

    def get_reservation(date)
      reservation = @reservations.find { |res| res.start_date == date }
      return reservation
    end

    def make_reservation(customer_id, room_number, start_date, end_date)
      # binding.pry
      duration = Duration.new(
        id: 1, start_date: start_date, end_date: end_date,
      )
      reservation = Reservation.new(
        id: 1,
        customer_id: customer_id,
        room: nil,
        duration: duration,
      )

      @reservations << reservation
    end

    def get_reservation_cost(id)
      # reservation_cost = Reservation.new(id: 1, cost:)
      reservation = find_reservation(id)
      return reservation.total_cost
    end
  end
end
