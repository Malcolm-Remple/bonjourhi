class AddSeekingSharingLongitudeLatitudeToMeetups < ActiveRecord::Migration[5.2]
  def change
    add_column :meetups, :longitude, :float
    add_column :meetups, :latitude, :float

    # add foreign key references with custom names
    # sharing lang
    add_reference :meetups, :sharing_lang, foreign_key: { to_table: :languages }

    # seeking lang
    add_reference :meetups, :seeking_lang, foreign_key: { to_table: :languages }

    # other attempt
    # add_column :meetups, :sharing_lang, :integer
    # add_index :meetups, :sharing_lang
    # add_column :meetups, :seeking_lang, :integer
    # add_index :meetups, :seeking_lang
  end
end
