class AddBookingRefToRoomBooking < ActiveRecord::Migration[5.1]
  def change
    add_reference :room_bookings, :booking, foreign_key: true
  end
end
