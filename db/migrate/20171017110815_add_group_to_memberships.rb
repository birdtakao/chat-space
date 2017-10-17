class AddGroupToMemberships < ActiveRecord::Migration[5.0]
  def change
    add_reference :memberships, :group, foreign_key: true
  end
end
