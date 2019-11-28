class Language < ApplicationRecord
  has_many :user_languages

  has_many :meetups, foreign_key: 'sharing_lang_id'
  has_many :meetups, foreign_key: 'seeking_lang_id'

  def self.get_sharing_lang(seeking_lang)
    languages = Language.all
    sharing_langs = languages - [seeking_lang]
    sharing_langs.sample
  end
end
