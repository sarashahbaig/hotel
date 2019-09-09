module HotelBooking
  class Room
    attr_reader :id, :number, :cost
    attr_accessor :availability, :reservation

    def initialize(id:, number:, cost: 200.0, availability:, reservation:)
      @id = id
      @number = number
      @cost = cost,
              @availability = availability,
      @reservation = reservation
    end

    def total_cost()
    end
  end
end
