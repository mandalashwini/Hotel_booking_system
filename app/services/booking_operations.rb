class Booking_operations

	 def showMyBooking(memberId)
	 	puts "id===ddd",memberId
	 	@bookingRecords=Member.find(memberId).bookings
       	@bookingRecords.each do |book|
	 		@roomsRecords=book.rooms
		 		@roomsRecords.each do |room|
		 			@hotelRecords=room.hotel.inspect
	 			end
	 	end

	 	puts "1111",@bookingRecords
	 	puts "222",@roomsRecords
	 	puts "333",@hotelRecords
	 end	
end