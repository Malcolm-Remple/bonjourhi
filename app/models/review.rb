class Review < ApplicationRecord
  belongs_to :user
  belongs_to :author, foreign_key: :author_id, class_name: "User"

  def date_to_string
    date.strftime("%b %d, %Y")
  end
end
