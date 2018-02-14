class SearchController < ApplicationController
        def new

        end
        def index
        	@hotels=Hotel.all
        end

        def searchView
          @searchObj=Search_operations.new(params)
          @searchHotelResult=@searchObj.searchHotel
          @searchRoomResult=@searchObj.searchRooms
          puts "777777"
          puts @searchRoomResult
          @searchRoomResult
#
        end

        def show
           puts params  
           @searchObj=Search_operations.new(params)
           #@searchRoomResult=Room.all.where(hotel_id: params[:id])
           @searchRoomResult=@searchObj.searchRooms()
         end


  end
