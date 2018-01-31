class AddMobileNumberToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :mobileNumber, :string
  end
end
