class SearchController < ApplicationController
        
        def searchView
          @searchObj=Search_operations.new(params)
          @searchHotelResult=@searchObj.searchHotel
          @searchHotelResult = Kaminari.paginate_array(@searchHotelResult).page(params[:page]).per(4)
        end

        def show
           @searchObj=Search_operations.new(params)
           @searchRoomResult=@searchObj.searchRooms()
           @searchRoomResult=@searchRoomResult.page(params[:page]).per(4)
           end
        

  end
