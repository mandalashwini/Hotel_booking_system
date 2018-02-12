class Search_operations

	def initialize(params)
		@params=params
		
		
	end
	def searchHotel
#	
   # puts @hotels.inspect
     @search=Hotel.search(@params)
    @hotels=@search.result(distinct: true)
    puts @hotels.inspect
	end

	def searchRooms
		#@room_search=Hotel.rooms.ransack(inactive_date_eq: nil).result
	    #puts "hdfgdshfsdfds",@room_search.inspect
	    
	    @a=Hotel.joins(:rooms).where(rooms: { inactive_date: nil }).ransack(@params)
	    puts @a.result.inspect


	    shop = Room.all
		puts shop.bookings.includes(room_booking:).where({ id: 1 })
	end

end