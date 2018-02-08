class Search_operations

	def initialize(param)
		puts "hello"+param
		@search_string=param

	end
	def hotel_search_function
		puts Hotel.find_by_location(@search_string).inspect
	end
end