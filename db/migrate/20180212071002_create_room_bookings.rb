class CreateRoomBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :room_bookings do |t|

      t.timestamps
    end
  end
end
