class VocabList < ApplicationRecord
  belongs_to :user
  belongs_to :language

  has_many :vocabs
end
