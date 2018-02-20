class BookingController < ApplicationController
  #def confirmBooking
   #     setBookingStatus
  #end
  
  def confirmBooking
      if member_signed_in?
          if params[:result1]!=nil 
           
                  Rails.cache.write("rooms",params[:result1])
                  setBookingStatus
                  #redirect_to booking_confirmBooking_path
          else
                flash[:alert]="select rooms"
                redirect_to request.referer
          end
      else
        redirect_to '/members/sign_in'
      end
  end

 
  def setBookingStatus
   # render plain:params[:result].inspect

      
      checkedRooms=Rails.cache.read("rooms")
      @hotel_id=Room.select("hotel_id").where("id=?",checkedRooms)

      @roomsList=Array.new
      checkedRooms.each do |rooms|
      @roomsList.push(Room.find(rooms.to_i))
      end

      @checkinDate1 = Rails.cache.read("checkinDate")
      @checkoutDate1 = Rails.cache.read("checkoutDate")
      @bookingDate1 = Rails.cache.read("bookingDate")
      searchRoomExist=Room.joins(:bookings).where(:bookings=>{checkinDate: @checkinDate1,checkoutDate: @checkoutDate1},id:@roomsList).uniq
          if(searchRoomExist.empty?)
                  @newBooking=Booking.create(checkinDate: @checkinDate1.to_s,checkoutDate: @checkoutDate1.to_s,bookingDate: @bookingDate1.to_s,member_id: current_member.id)
                  @newBooking.rooms << @roomsList   
                  @hotelsList=@roomsList[0].hotel
                  UserMailer.booking_confirmation(Member.find(current_member.id)).deliver_now
                 # redirect_to 'booking/bookingSuccessMessage'
          else
                flash[:alert]="Rooms has been booked already.."
                redirect_to request.referer
         end
  end

  

 
  def myBooking
    bookingobj=Booking_operations.new
    @mem=Member.find(current_member.id)
    @bookingDetails=@mem.bookings.distinct
        @bookingDetails.each do |book|
             @booking=book
             @roomDetails=bookingobj.getRoomsDetails(@booking)
            @hotelDetails=bookingobj.getHotelDetails
        
        end
    
    end
   


 end