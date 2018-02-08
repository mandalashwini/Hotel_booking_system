class SearchController < ApplicationController
  def index
  	@hotels=Hotel.all
  end
  def searchView
  	 #	render plain: params[:location].inspect
  	 @hotels=Hotel.all
  #render plain: params.inspect
    puts params[:location]
    #@param=params[:location]
    searchObj=Search_operations.new(params[:location])
    searchObj.searchHotel
  end
end
