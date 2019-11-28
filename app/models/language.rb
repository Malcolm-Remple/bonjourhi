class Language < ApplicationRecord
  has_many :user_languages

  has_many :meetups, foreign_key: 'sharing_lang_id'
  has_many :meetups, foreign_key: 'seeking_lang_id'
end
