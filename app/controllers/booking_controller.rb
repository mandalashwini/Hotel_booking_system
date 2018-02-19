class BookingController < ApplicationController
  def confirmBooking
   @flag=1
  end
  
  def roomBook
      if member_signed_in?
          if params[:result]!=nil 
           
                  #confirmBooking
                  @roomparam=params[:result]
                  puts "uu",@roomparam
                  if confirmBooking
                    setBookingStatus
                   end
          else
          
                redirect_to request.referer
          end
      else
        redirect_to '/members/sign_in'
      end
  end

 
  def setBookingStatus
   # render plain:params[:result].inspect

      
      checkedRooms=params[:result]
      @hotel_id=Room.select("hotel_id").where("id=?",checkedRooms)

      @roomsList=Array.new
      checkedRooms.each do |rooms|
      @roomsList.push(Room.find(rooms.to_i))
      end
      searchRoomExist=Room.joins(:bookings).where(:bookings=>{checkinDate: @checkoutDate1,checkoutDate: @checkoutDate1},id:@roomsList).uniq
      if(searchRoomExist.empty?)
      create
      @newBooking.rooms << @roomsList   
      @hotelsList=@roomsList[0].hotel
     else
      flash[:alert]="booking already done"
      redirect_to request.referer
    end
  end

  def create
      @checkinDate1 = Rails.cache.read("checkinDate")
      @checkoutDate1 = Rails.cache.read("checkoutDate")
      @bookingDate1 = Rails.cache.read("bookingDate")
      #if (Rails.cache.read("rooms")==params[:])
      puts "settt",params[:result]
      @newBooking=Booking.create(checkinDate: @checkoutDate1.to_s,checkoutDate: @checkoutDate1.to_s,bookingDate: @bookingDate1.to_s,member_id: current_member.id)
  end

  def checkRoomAlreadyBook
    
    puts "jjj",result.class
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