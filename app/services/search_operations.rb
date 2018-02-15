class Search_operations

	def initialize(params)
		@name_or_location=params[:location_or_hotelname]
		@checkinDate=params[:checkinDate]
		@checkoutDate=params[:checkoutDate]
	    @hotel_id=params[:id]
		
		
	end
	
	def searchHotel
	    @booking_rooms=Room.joins(:bookings).select("id").where('("checkinDate" BETWEEN ? AND ?) OR ("checkoutDate" BETWEEN ? AND ?) ',@checkinDate,@checkoutDate,@checkinDate,@checkoutDate)
		 
		 @availableRooms=Hotel.joins(:rooms).where.not(:rooms => {id: @brooms} ).where("name ILIKE ? OR location ILIKE ?","#{@name_or_location}%","#{@name_or_location}%").uniq
       end

	def searchRooms
			puts "yyyyy"
			puts @hotel_id
			@roomShow=Room.joins(:hotel).where(hotel_id: @hotel_id).where.not(:rooms => {id: @booking_rooms} ).where(inactive_date: nil)
	end
		
end