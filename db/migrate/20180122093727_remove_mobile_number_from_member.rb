class RemoveMobileNumberFromMember < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :mobileNumber, :integer
  end
end
