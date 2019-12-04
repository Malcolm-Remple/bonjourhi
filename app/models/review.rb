class Review < ApplicationRecord
  belongs_to :user
  belongs_to :author, foreign_key: :author_id, class_name: "User"
  
  def date_to_string
    created_at.strftime("%d/%m/%Y")
  end
end