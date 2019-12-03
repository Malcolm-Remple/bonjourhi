class CreateVocabLists < ActiveRecord::Migration[5.2]
  def change
    create_table :vocab_lists do |t|
      t.references :language, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
