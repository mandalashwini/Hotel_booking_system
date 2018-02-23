class Booking_operations

	

 def self.read_Rooms
      @checkedRooms=Rails.cache.read("rooms")
      @checkedRooms
  end
  def self.read_checkin
      @checkinDate1 = Rails.cache.read("checkinDate")
      @checkinDate1
  end
  def self.read_checkout
      @checkoutDate1 = Rails.cache.read("checkoutDate")
      @checkoutDate1
  end
  def self.read_bookingDate
      @bookingDate1 = Rails.cache.read("bookingDate")
  end

 def self.convert_to_IntegerArray
      @roomsList=Array.new
      @checkedRooms.each do |rooms|
      @roomsList.push(Room.find(rooms.to_i))
      end
      
       @roomsList
  end


	def self.bookingConfirmationMail(member_id)
      UserMailer.booking_confirmation(Member.find(member_id)).deliver_now
  end
end