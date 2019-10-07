class RemovePriceFromRoom < ActiveRecord::Migration[5.1]
  def change
    remove_column :rooms, :price, :int
  end
end
