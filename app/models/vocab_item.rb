class VocabItem < ApplicationRecord
  belongs_to :language
  belongs_to :user

  validates :content, presence: true
end
