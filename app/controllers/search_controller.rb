class SearchController < ApplicationController
        
        def searchView
          @searchObj=Search_operations.new(params)
          setCache(params)
          @searchHotelResult=@searchObj.searchHotel
          @searchHotelResult = Kaminari.paginate_array(@searchHotelResult).page(params[:page]).per(4)
        end

        def show 
           @searchObj=Search_operations.new(params)
           @searchRoomResult=@searchObj.searchRooms()
           @searchRoomResult=@searchRoomResult.page(params[:page]).per(4)
        end
  
        def setCache(params)
          Rails.cache.write("checkinDate",params[:checkinDate])
          Rails.cache.write("checkoutDate",params[:checkoutDate])
          Rails.cache.write("bookingDate",Date.today)
          #response1 = Rails.cache.read("checkinDate")
          #response2 = Rails.cache.read("checkoutDate")
          #response3 = Rails.cache.read("bookingDate")
          #puts "qqqq",response1          
          
          #puts "qqqq",response2          
          #puts "qqqq",response3          
        end        

  end
