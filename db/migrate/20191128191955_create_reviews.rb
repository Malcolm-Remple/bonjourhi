class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :main_quality
      t.date :date

      t.timestamps
    end
  end
end
