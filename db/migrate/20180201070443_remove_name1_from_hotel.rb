class RemoveName1FromHotel < ActiveRecord::Migration[5.1]
  def change
    remove_column :hotels, :name, :string
  end
end
