class CreateMeetups < ActiveRecord::Migration[5.2]
  def change
    create_table :meetups do |t|
      t.date :date
      t.time :start_time
      t.integer :duration
      t.string :location
      t.boolean :confirmed
      t.text :greeting
      t.integer :sender_id
      t.integer :recipient_id

      t.timestamps
    end
    add_index :meetups, :sender_id
    add_index :meetups, :recipient_id
  end
end
