class BookingController < ApplicationController
  def roomBook
  	if member_signed_in?
  		puts "ashuuuuu"
  		redirect_to booking_roomBook_path
  	else
  		puts "priyaa"
  		redirect_to new_member_session_path
  		
  	end
  end

 

end
