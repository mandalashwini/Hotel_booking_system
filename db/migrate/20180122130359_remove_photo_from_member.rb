class RemovePhotoFromMember < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :photo, :binary
  end
end
