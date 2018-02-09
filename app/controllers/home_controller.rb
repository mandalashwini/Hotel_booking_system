class HomeController < ApplicationController
  def index
    
  end

  def search_index
  @search=Hotel.search(params[:q])
  @hotels=@search.result
  end

  def userview
  #	render plain: params[:location].inspect
  	render plain: params.inspect
    puts params[:location].class
    @param=params[:location]
    operations_Object=Search_operations.new(@param)
    operations_Object.searchHotel
  end


  def create
  end
 
end
