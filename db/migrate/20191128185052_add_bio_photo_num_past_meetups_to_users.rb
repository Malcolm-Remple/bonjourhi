class AddBioPhotoNumPastMeetupsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :bio, :text
    add_column :users, :photo, :string
    add_column :users, :num_of_past_meetups, :integer
  end
end
