class AddLanguageToVocabItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :vocab_items, :language, index: true, foreign_key: true
  end
end
