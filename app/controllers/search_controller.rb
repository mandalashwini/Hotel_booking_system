class SearchController < ApplicationController
  def index
  	@hotels=Hotel.all
  end
  def searchView
  	render plain: params.inspect
    searchObj=Search_operations.new(params)
    @searchResult=searchObj.searchHotel
    puts "In SearchController",@searchResult.inspect
  end
end
