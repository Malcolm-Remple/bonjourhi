class UserLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language

  def level
      case proficiency
    when 1
      "20%"
    when 2
      "40%"
    when 3
      "60%"
    when 4
      "80%"
    when 5
      "100%"
    end
  end
end
