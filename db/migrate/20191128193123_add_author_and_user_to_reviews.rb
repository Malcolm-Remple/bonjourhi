class AddAuthorAndUserToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :author, references: :users, index: true
    add_foreign_key :reviews, :users, column: :author_id

    add_reference :reviews, :user, references: :users, index: true
    add_foreign_key :reviews, :users
  end
end
