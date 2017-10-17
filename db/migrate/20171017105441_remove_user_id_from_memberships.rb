class RemoveUserIdFromMemberships < ActiveRecord::Migration[5.0]
  def change
    remove_column :memberships, :user_id, :integer
  end
end
