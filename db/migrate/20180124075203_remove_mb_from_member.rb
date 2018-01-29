class RemoveMbFromMember < ActiveRecord::Migration[5.1]
  def change
    remove_column :members, :mb, :bigint
  end
end
