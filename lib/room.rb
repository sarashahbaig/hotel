module HotelBooking
  class Room
    attr_reader :id, :number, :cost, :availability, :reservation
    attr_accessor :availability

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
