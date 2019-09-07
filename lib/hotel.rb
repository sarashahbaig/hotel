require_relative "room"
# require_relative "customer"
require_relative "duration"
require_relative "reservation"

module HotelBooking
  class Hotel
    TOTAL_ROOMS = 20
    attr_reader :id, :rooms
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
      reservation = Reservation.new(id: 1, duration: date)
      @reservations << reservation
    end

    def make_reservation(customer_id, room_number, start_date, end_date)
      # binding.prye
      duration = Duration.new(id: 1, start_date: start_date, end_date: end_date)
      # duration = DateRange.new()
      # reservation = Reservation.new(1, customer_id, room_number, duration)
    end

    def get_reservation_cost(id)
      # reservation_cost = Reservation.new(id: 1, cost:)
      reservation = find_reservation(id)
      return reservation.total_cost
    end
  end
end
