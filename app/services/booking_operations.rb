class Booking_operations

	

	 def self readCache
      @@checkedRooms=Rails.cache.read("rooms")
      @@checkinDate1 = Rails.cache.read("checkinDate")
      @@checkoutDate1 = Rails.cache.read("checkoutDate")
      @@bookingDate1 = Rails.cache.read("bookingDate")
  end

 def self.convert_to_IntegerArray
      @@roomsList=Array.new
      @@@checkedRooms.each do |rooms|
      @@roomsList.push(Room.find(rooms.to_i))
      end
  end


	def self.bookingConfirmationMail
      UserMailer.booking_confirmation(Member.find(current_member.id)).deliver_now
  end
end