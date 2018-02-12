class SearchController < ApplicationController
  
  def searchView
    @search=Hotel.search(params[:q])
    #@hotels=@search.result(distinct: true)
    #puts @hotels.inspect
    searchObj=Search_operations.new(params[:q])
    searchObj.searchHotel
    searchObj.searchRooms
  end
end
