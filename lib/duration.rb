require "date"
require "pry"

module HotelBooking
  class Duration
    attr_reader :id, :start_day, :end_day

    def intialize(id, start_day, end_day)
      @id = id
      @start_day = convert_to_date(start_day)
      @end_day = convert_to_date(end_day)
      binding.pry

      if @end_day <= @start_day
        raise ArgumentError.new "Invaid dates provided"
      end
    end

    def convert_to_date(date_str)
      date_arr = date_str.split("-")
      year = date_arr[0]
      month = date_arr[1]
      day = date_arr[2]
      return Date.new(year, month, day)
    end

    def get_duration()
      duration = @end_day - @start_day
      return duration
    end

    def overlap?(duration)
      if @start_date <= duration.end_date && duration.@start_date <= @end_date
        return false
      end
      return true
    end
  end
end
