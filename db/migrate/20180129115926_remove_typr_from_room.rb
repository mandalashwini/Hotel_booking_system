class RemoveTyprFromRoom < ActiveRecord::Migration[5.1]
  def change
    remove_column :rooms, :type, :string
  end
end
