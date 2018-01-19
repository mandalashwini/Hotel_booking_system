class RemoveNameFromMember < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :name, :string
  end
end
