class AddMobilenumberFromMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :mobileNumber, :bigint
  end
end
