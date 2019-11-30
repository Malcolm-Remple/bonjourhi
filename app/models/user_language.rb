class UserLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :language

  # for rendering progress bar css
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

  # displays UserLangauge proficiency as human-friendly string
  def proficiency_string
      case proficiency
    when 1
      "Beginner"
    when 2
      "Elementary"
    when 3
      "Intermediate"
    when 4
      "Advanced"
    when 5
      "Native"
    end
  end

end
