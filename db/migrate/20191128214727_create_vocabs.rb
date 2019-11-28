class CreateVocabs < ActiveRecord::Migration[5.2]
  def change
    create_table :vocabs do |t|
      t.string :item
      t.references :vocab_list, foreign_key: true

      t.timestamps
    end
  end
end
