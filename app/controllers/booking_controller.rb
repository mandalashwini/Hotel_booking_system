class BookingController < ApplicationController
 
  
  def confirmBooking
      if member_signed_in?
          if params[:result1]!=nil 
           
                  Rails.cache.write("rooms",params[:result1])
                  setBookingStatus
                  #redirect_to booking_confirmBooking_path
          else
                flash[:alert]="Rooms not selected..."
                redirect_to request.referer
          end
      else
        redirect_to '/members/sign_in'
      end
  end

 
  def setBookingStatus
   
      readCache
      @hotel_id=Room.select("hotel_id").where("id=?",@checkedRooms)
      convert_to_IntegerArray
      @searchRoomExist=Room.joins(:bookings).where(:bookings=>{checkinDate: @checkinDate1,checkoutDate: @checkoutDate1},id:@roomsList).uniq
          if(@searchRoomExist.empty?)
                  create
                  bookingConfirmationMail
                 
          else
                flash[:alert]="Rooms has been booked already.."
                redirect_to request.referer
         end
  end

  def bookingConfirmationMail
      UserMailer.booking_confirmation(Member.find(current_member.id)).deliver_now
  end

  def create
      @newBooking=Booking.create(checkinDate: @checkinDate1.to_s,checkoutDate: @checkoutDate1.to_s,bookingDate: @bookingDate1.to_s,member_id: current_member.id)
      @newBooking.rooms << @roomsList   
      @hotelsList=@roomsList[0].hotel
                  
  end

  def readCache
      @checkedRooms=Rails.cache.read("rooms")
      @checkinDate1 = Rails.cache.read("checkinDate")
      @checkoutDate1 = Rails.cache.read("checkoutDate")
      @bookingDate1 = Rails.cache.read("bookingDate")
  end

  def convert_to_IntegerArray
      @roomsList=Array.new
      @checkedRooms.each do |rooms|
      @roomsList.push(Room.find(rooms.to_i))
      end
  end



  def myBooking

    bookingobj=Booking_operations.new
    @member=Member.find(current_member.id)
    @bookingDetails=@member.bookings.distinct
    @bookingDetails=@bookingDetails.page(params[:page]).per(2)
    end
   

   def bookingDetails
    puts "ooo",params.inspect
   end


 end