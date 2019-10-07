class RemoveNameFromHotel < ActiveRecord::Migration[5.1]
  def change
    remove_column :hotels, :name, :string
  end
end
