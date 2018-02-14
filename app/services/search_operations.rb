class Search_operations

	def initialize(params)
		@name_or_location=params[:location_or_hotelname]
		@checkinDate=params[:checkinDate]
		@checkoutDate=params[:checkoutDate]
		puts @a=params[:id]
		puts @checkinDate
		puts "11hello",@name_or_location
		
	end
	
	def searchHotel
	    @brooms=Room.joins(:bookings).select("id").where('("checkinDate" BETWEEN ? AND ?) OR ("checkoutDate" BETWEEN ? AND ?) ',@checkinDate,@checkoutDate,@checkinDate,@checkoutDate)
		 
		 @availableRooms=Hotel.joins(:rooms).where.not(:rooms => {id: @brooms} ).where("name ILIKE ? OR location ILIKE ?","#{@name_or_location}%","#{@name_or_location}%").uniq
       end

	def searchRooms
			puts "yyyyy"
			puts @a
			@roomShow=Room.joins(:hotel).where(hotel_id: @a).where.not(:rooms => {id: @brooms} ).where(inactive_date: nil)
	end
		
end