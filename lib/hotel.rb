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
      reservations_for_date = []
      @reservations.each do |res|
        if date >= res.duration.start_date && date <= res.duration.end_date
          reservations_for_date << res
        end
      end
      # reservation = @reservations.find { |res| res.start_date == date }
      return reservations_for_date
    end

    def make_reservation(customer_id, start_date, end_date)
      room_to_reserve = @rooms.find { |room| room.availability }

      room_index = @rooms.find_index(room_to_reserve)
      @rooms[room_index].availability = false

      duration = Duration.new(
        start_date: start_date, end_date: end_date,
      )
      reservation = Reservation.new(
        id: 1,
        customer_id: customer_id,
        room: room_index,
        duration: duration,
      )
      @reservations << reservation
    end

    def get_reservation_cost(res_index)
      # reservation_cost = Reservation.new(id: 1, cost:)
      res = @reservations[res_index]
      total_cost = 0
      if res != nil
        total_cost = res.get_total_cost()
      end
      return total_cost
    end
  end
end
