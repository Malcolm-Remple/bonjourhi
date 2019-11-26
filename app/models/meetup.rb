class Meetup < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"

  validates :date, presence: true
  validates :start_time, presence: true
  validates :duration, presence: true
  validates :location, presence: true
  validates :greeting, length: {maximum: 150}

  def opposite_user(current_user)
    sender == current_user ? recipient : sender
  end
end
