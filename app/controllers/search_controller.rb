class SearchController < ApplicationController
        def new

        end
        def index
        	@hotels=Hotel.all
        end

        def searchView
          @searchObj=Search_operations.new(params)
          @searchHotelResult=@searchObj.searchHotel
        end

        def show
           @searchObj=Search_operations.new(params)
           #@searchRoomResult=Room.all.where(hotel_id: params[:id])
           @searchRoomResult=@searchObj.searchRooms()
           puts "!!!!",@searchRoomResult
         end
        

  end
