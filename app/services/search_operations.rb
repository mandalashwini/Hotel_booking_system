class Search_operations

	def initialize(params)
		puts "paraass",params
		@name_or_location=params[:location_or_hotelname]
		@checkinDate=params[:checkinDate]
		@checkoutDate=params[:checkoutDate]
	    @hotel_id=params[:id]
	   
	 end
	
	def searchHotel
		puts "aaaa",@checkinDate
		@booking_rooms=Room.bookingrooms(@checkinDate,@checkoutDate)
	    @availableRooms=Hotel.hotelsearchResult(@booking_rooms,@name_or_location)
       end

	def searchRooms
		@roomShow=Room.roomsearchResult(@hotel_id,@booking_rooms) 
	end
	
    
end	
