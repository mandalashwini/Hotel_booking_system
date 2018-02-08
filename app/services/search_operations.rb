class Search_operations

	def initialize(param)
		puts "hello"+param
		@searchString=param

	end
	def searchHotel
		puts Hotel.find_by_location(@searchString).inspect
	end
end