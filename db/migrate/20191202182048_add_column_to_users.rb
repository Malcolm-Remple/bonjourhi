class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :pending_event_confirmation, :integer
  end
end
