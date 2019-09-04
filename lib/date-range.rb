
require 'time'

require_relative 'hotel'
require_relative 'reservation'


class Range < Reservation

    def intialize()
        super(id, cost, start_day, end_day, status)
    end

    # dates should not over lap

end
