class AddNameToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :Name, :text
  end
end
