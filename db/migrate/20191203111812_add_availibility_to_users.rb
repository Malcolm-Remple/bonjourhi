class AddAvailibilityToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :availibility, :string
  end
end
