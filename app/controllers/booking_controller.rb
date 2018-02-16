class BookingController < ApplicationController
  
  
  def roomBook
    if member_signed_in?
          puts "dfdsf",current_member.id
          setBookingStatus
   else
    redirect_to '/members/sign_in'
   end
  end

 
  def setBookingStatus
     bookingObj=Booking_operations.new(params)
     checkinDate1 = Rails.cache.read("checkinDate")
     checkoutDate1 = Rails.cache.read("checkoutDate")
     bookingDate1 = Rails.cache.read("bookingDate")
     newBooking=Booking.create(checkinDate: checkoutDate1.to_s,checkoutDate: checkoutDate1.to_s,bookingDate: bookingDate1.to_s)
    
     #bookingObj.setBookingStatus(newBooking.id)
      checkedRooms=params[:result]

        @roomsList=Array.new
        checkedRooms.each do |rooms|
          @roomsList.push(Room.find(rooms.to_i))
        end


        #render plain:@roomsList.inspect   
      #   newBooking.rooms(findRoom)
        newBooking.rooms << @roomsList      

  end

 end