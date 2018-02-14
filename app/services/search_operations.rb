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
		 availHotelRooms=Hotel.joins(:rooms).where.not(:rooms => {id: @brooms} ).uniq
		searchHotelResult= Hotel.where("name ILIKE ? OR location ILIKE ?","#{@name_or_location}%","#{@name_or_location}%").uniq
		@searchResult=availHotelRooms & searchHotelResult
		
		end

	def searchRooms

			#  @result=Room.joins(:hotel).where('hotel_id':@searchResult)
			# brooms=Room.joins(:bookings).select("id").where('("checkinDate" BETWEEN ? AND ?) OR ("checkoutDate" BETWEEN ? AND ?) ',@checkinDate,@checkoutDate,@checkinDate,@checkoutDate)
			 #bbrooms=(Room.joins(:bookings).select("id"))-brooms
			 puts "yyyyy"

			 #puts bbrooms.inspect
			# puts params.inspect
			 @searchRoomResult=Room.all.where(hotel_id: @a ).where.not(:rooms => {id: @brooms} )

		
	end
		
end