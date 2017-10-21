class RemoveMessageIdToMessages < ActiveRecord::Migration[5.0]
  def change
    remove_column :messages, :message_id, :integer
  end
end
