class RemoveRoomRefToBooking < ActiveRecord::Migration[5.1]
  def change
    remove_reference :bookings, :room, foreign_key: true
  end
end
