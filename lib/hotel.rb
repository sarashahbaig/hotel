require_relative "room"

module HotelBooking
  class Hotel
    TOTAL_ROOMS = 20
    attr_reader :id, :rooms

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
      TOTAL_ROOMS.times do |id|
        room = Room.new(id: id + 1)
        @rooms << room
      end
    end

    def get_total_rooms()
      return @rooms.length
    end

    def make_reservation(date)
      reservation = Reservation.new(id: 1, duration: date)
      @reservations << reservation
    end
  end
end
