module HotelBooking
  class Room
    attr_reader :id, :number, :cost

    def initialize(id:, number:, cost: 200.0, availability:, reservation:)
      @id = id
      @number = number
      @cost = cost
    end

    def total_cost()
    end
  end
end
