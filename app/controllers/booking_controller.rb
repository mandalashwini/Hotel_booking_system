class BookingController < ApplicationController
  def checkLoginStatus
  	if member_signed_in?
  		puts "ashuuuuu"
  		redirect_to booking_roomBook_path
  	else
  		puts "priyaa"
  		redirect_to new_member_session_path
  	end
  end
  def roomBook
    bookingObj=Booking_operations.new(params)
    

  end

 

end
