class AddHotelNameToHotel < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :Hotel_Name, :string
  end
end
