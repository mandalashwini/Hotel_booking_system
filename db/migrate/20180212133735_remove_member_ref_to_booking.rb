class RemoveMemberRefToBooking < ActiveRecord::Migration[5.1]
  def change
    remove_reference :bookings, :member, foreign_key: true
  end
end
