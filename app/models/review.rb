class Review < ApplicationRecord
  belongs_to :user
  belongs_to :author, foreign_key: :author_id, class_name: "User"
end
