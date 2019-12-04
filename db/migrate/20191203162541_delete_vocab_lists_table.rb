class DeleteVocabListsTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :vocab_items, :vocab_list_id
    drop_table :vocab_lists
  end
end
