class AddNameToMember < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :firstName, :string
    add_column :members, :lastName, :string
  end
end
