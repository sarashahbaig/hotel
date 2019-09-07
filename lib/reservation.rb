module HotelBooking
  class Reservation
    COST_PER_NIGHT = 200
    attr_reader :id, :customer_id, :room, :duration, :total_cost

    def initialize(id:, customer_id:, room:, duration:, total_cost: COST_PER_NIGHT)
      @id = id
      @customer_id = customer_id
      @room = room
      @total_cost = total_cost
      @duration = duration
    end

    def total_cost()
      total_cost = @duration * COST_PER_NIGHT
      return total_cost
    end
  end
end
