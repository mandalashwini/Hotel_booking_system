class AddPriceToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :room_price, :float
  end
end
