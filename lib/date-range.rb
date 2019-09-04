
module HotelBooking
  class DateRange
    attr_reader :id, :start_day, :end_day

    def intialize(id:, start_day:, end_day:)
      @id = id
      @start_day = start_day
      @end_day = end_day
    end
  end
end
