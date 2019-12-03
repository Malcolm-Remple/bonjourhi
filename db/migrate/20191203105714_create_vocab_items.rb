class CreateVocabItems < ActiveRecord::Migration[5.2]
  def change
    create_table :vocab_items do |t|
      t.string :content
      t.references :vocab_list, foreign_key: true

      t.timestamps
    end
  end
end
