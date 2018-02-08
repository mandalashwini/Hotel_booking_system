class HomeController < ApplicationController
  def index
  	@hotels=Hotel.all
  end

  def search_index
  	@hotels=Hotel.all
  	puts @hotel.inspect
  end

  def userview
  #	render plain: params[:location].inspect
  	render plain: params.inspect
    puts params[:location].class
    @param=params[:location]
    operations_Object=Search_operations.new(@param)
    operations_Object.search_hotel_function
  end


  def create
  end
 
end
