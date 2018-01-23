class AddMobileNumberFromMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :mobileNumber, :float
  end
end
