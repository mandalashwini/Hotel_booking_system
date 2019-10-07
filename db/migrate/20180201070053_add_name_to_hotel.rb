class AddNameToHotel < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :name, :string
  end
end
