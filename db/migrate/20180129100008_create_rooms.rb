class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :number_bedrooms
      t.integer :price
      t.string :type
      t.string :status
      t.date :inactive_date

      t.timestamps
    end
  end
end
