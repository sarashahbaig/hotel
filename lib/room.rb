module HotelBooking
  class Room
    attr_reader :id, :cost

    def initialize(id:, cost: 200.0)
      @id = id
      @cost = cost
    end
  end
end
