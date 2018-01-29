class CreateHotels < ActiveRecord::Migration[5.1]
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :rating
      t.string :location
      t.string :description

      t.timestamps
    end
  end
end
