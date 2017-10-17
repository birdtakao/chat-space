class RenamePublishdColumnToGroups < ActiveRecord::Migration[5.0]
  def change
    rename_column :groups, :Name, :name
  end
end
