class RemoveMobilenumberFromMember < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :mobileNumber, :bigint
  end
end
