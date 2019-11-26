class AddDefaultToConfirmed < ActiveRecord::Migration[5.2]
  def change
    change_column :meetups, :confirmed, :boolean, default: false
    change_column :meetups, :greeting, :text, default: "Hi, looking forward to meeting you!"
  end
end
