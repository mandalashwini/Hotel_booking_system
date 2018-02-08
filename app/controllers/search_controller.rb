class SearchController < ApplicationController
  def index
  	@hotels=Hotel.all
  end
  def searchView
  	 #	render plain: params[:location].inspect
  	 @hotels=Hotel.all
  	render plain: params.inspect
    puts params[:hotels].class
    @param=params[:hotels]
    operations_Object=Search_operations.new(@param)
    operations_Object.hotel_search_function
 
  end
end
