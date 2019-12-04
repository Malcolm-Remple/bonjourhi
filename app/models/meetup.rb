class Meetup < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"

  belongs_to :sharing_lang, foreign_key: :sharing_lang_id, class_name: "Language"
  belongs_to :seeking_lang, foreign_key: :sharing_lang_id, class_name: "Language"

  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
  validates :location, presence: true
  validates :greeting, length: {maximum: 150}

  def opposite_user(current_user)
    sender == current_user ? recipient : sender
  end

  def end_time
    # returns end time (note: duration in minutes)
    start_time + (duration * 60)
  end

  def meetup_occurred?
    meetup_precise_date = self.date.to_datetime + self.start_time.hour.hour + self.start_time.min.minute + self.duration.minute
    meetup_precise_date < DateTime.now
  end

  def real_start_time
   self.date.to_datetime + self.start_time.hour.hour + self.start_time.min.minute
  end
end
