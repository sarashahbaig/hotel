require "date"
require "pry"

module DateRange
  class DateRange
    attr_accessor :start_date, :end_date

    def initialize(start_date, end_date)
      @start_date = start_date
      @end_date = end_date

      if @end_date <= @start_date
        raise ArgumentError.new "Invaid dates provided"
      end
    end

    def overlap?(other)
      return other.start_date == @start_date && other.end_date == @end_date
    end

    def include?(date)
      return false
    end

    def nights
      return @end_date - @start_date.to_i
    end
  end
end
