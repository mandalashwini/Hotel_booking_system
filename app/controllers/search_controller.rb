class SearchController < ApplicationController
        
        def searchView
             
              @searchObj=Search_operations.new(params)
              setCache(params)
              @searchHotelResult=@searchObj.searchHotel
              if @searchHotelResult.empty?
                 redirect_to request.referer
                 flash[:alert] = "search Not Found"
               else
              @searchHotelResult = Kaminari.paginate_array(@searchHotelResult).page(params[:page]).per(2)
            end
             
        end

        def show 
          
           @searchObj=Search_operations.new(params)
           @searchRoomResult=@searchObj.searchRooms()
           @searchRoomResult=@searchRoomResult.page(params[:page]).per(2)
        end
  
        def setCache(params)
          Rails.cache.write("checkinDate",params[:checkinDate])
          Rails.cache.write("checkoutDate",params[:checkoutDate])
          Rails.cache.write("bookingDate",Date.today)

          
        end        

  end
