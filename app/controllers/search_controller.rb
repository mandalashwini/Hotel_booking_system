class SearchController < ApplicationController
  
  def searchView
    @search=Hotel.search(params[:name_cont])
    @hotels=@search.result
    puts @hotels.inspect
    searchObj=Search_operations.new(params[:name_cont])
    searchObj.searchHotel
  end
end
