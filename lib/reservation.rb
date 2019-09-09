module HotelBooking
  class Reservation
    COST_PER_NIGHT = 200
    attr_reader :id, :customer_id, :room, :duration, :cost_per_night

    def initialize(id:, customer_id:, room:, duration:, cost_per_night: COST_PER_NIGHT)
      @id = id
      @customer_id = customer_id
      @room = room
      @cost_per_night = cost_per_night
      @duration = duration
    end

    def get_total_cost()
      total_cost = @duration.get_nights() * @cost_per_night
      return total_cost
    end
  end
end
