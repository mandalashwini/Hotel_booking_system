class Booking_operations

	
	
		def getRoomsDetails(bookingDetails)
			@roomDetails=Room.roomDetails(bookingDetails) 
		end

		def getHotelDetails
			@hotelDetails=Hotel.hotelDetails(@roomDetails) 
		end
	 
end