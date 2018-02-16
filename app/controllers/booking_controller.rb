class BookingController < ApplicationController
  
  
  def roomBook
      if member_signed_in?
          if params[:result]!=nil
              setBookingStatus
               flash.now[:alert] = 'Booking Success!!'
            else
               flash.now[:alert] = 'Rooms Not Selected!!'
             end
      else
        redirect_to '/members/sign_in'
      end
  end

 
  def setBookingStatus
   # render plain:params[:result].inspect
  
      checkinDate1 = Rails.cache.read("checkinDate")
      checkoutDate1 = Rails.cache.read("checkoutDate")
      bookingDate1 = Rails.cache.read("bookingDate")
      newBooking=Booking.create(checkinDate: checkoutDate1.to_s,checkoutDate: checkoutDate1.to_s,bookingDate: bookingDate1.to_s,member_id: current_member.id)
    
     #bookingObj.setBookingStatus(newBooking.id)
      checkedRooms=params[:result]

        @roomsList=Array.new
        checkedRooms.each do |rooms|
          @roomsList.push(Room.find(rooms.to_i))
        end
        newBooking.rooms << @roomsList      
      

  end

 end