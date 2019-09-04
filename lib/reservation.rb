class Reservation < Hotel
    attr_reader :id, :cost, :start_day, :end_day, :status

    def initialize(id, cost, start_day, end_day, status)
        super(id, rooms)
        @cost = cost
        @start_day = start_day
        @end_day = end_day
        @status = status
    end

 invalid reservation (end day can not be start day)  
 it will have a start day and a end_day(get the range of the reservation of the room)



 it will have a cost($200/night)
 it will have list of rooms( numbered from 1 - 20)
 status 

end