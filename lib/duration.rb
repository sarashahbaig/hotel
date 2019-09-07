require "date"
require "pry"

module HotelBooking
  class Duration
    attr_reader :id, :start_date, :end_date

    def initialize(id:, start_date:, end_date:)
      @id = id
      @start_date = convert_to_date(start_date)
      @end_date = convert_to_date(end_date)

      # if @end_date <= @start_date
      #   raise ArgumentError.new "Invaid dates provided"
      # end
    end

    def convert_to_date(date_str)
      date_arr = date_str.split("-")
      # binding.pry
      year = date_arr[0].to_i
      month = date_arr[1].to_i
      date = date_arr[2].to_i

      return Date.new(year, month, date)
    end

    def get_duration()
      duration = @end_date - @start_date
      return duration
    end

    def overlap?(duration)
      if @start_date <= duration.end_date && duration.start_date <= @end_date
        return false
      end
      return true
    end
  end
end
