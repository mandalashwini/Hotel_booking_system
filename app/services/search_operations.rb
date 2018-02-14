class Search_operations

	def initialize(params)
		@name_or_location=params[:location_or_hotelname]
		@checkinDate=params[:checkinDate]
		@checkoutDate=params[:checkoutDate]
		puts @checkinDate
		puts "11hello",@name_or_location
		
	end
	
	def searchHotel
		 brooms=Room.joins(:bookings).select("id").where('("checkinDate" BETWEEN ? AND ?) OR ("checkoutDate" BETWEEN ? AND ?) ',@checkinDate,@checkoutDate,@checkinDate,@checkoutDate)
		 availHotelRooms=Hotel.joins(:rooms).where.not(:rooms => {id: brooms} ).uniq
		 puts "availHotelRooms",availHotelRooms.inspect
		 puts "hiii"
		
	# puts "#{@checkinDate}"
	name_or_location = @name_or_location+"%"
		searchHotelResult= Hotel.where("name ILIKE ? OR location ILIKE ?",name_or_location,"#{@name_or_location}%").uniq
		puts "searchHotelResult",searchHotelResult.inspect
		searchResult=availHotelRooms & searchHotelResult
		puts "searchResult",searchResult.inspect
		return searchResult 
	end
		
end