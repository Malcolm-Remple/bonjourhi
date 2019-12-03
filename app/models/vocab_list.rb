class VocabList < ApplicationRecord
  belongs_to :language
  belongs_to :user

  has_many :vocab_items
end
