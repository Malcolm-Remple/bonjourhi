class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_languages
  has_many :languages, through: :user_languages

  has_many :reviews  # as a reviewee (user)
  has_many :reviews, as: :author

  has_many :vocab_lists
  has_many :vocabs, through: :vocab_lists
  # has_many :meetups, as: :sender
  # has_many :meetups, as: :recipient

  def meetups
    Meetup.where("sender_id = ? OR recipient_id = ?", id, id)
  end

  def outbound_meetup_requests
    Meetup.where("sender_id = ? AND confirmed = false", id)
  end

  def inbound_meetup_requests
    Meetup.where("recipient_id = ? AND confirmed = false", id)
  end

  def confirmed_meetups
    Meetup.where("(sender_id = ? OR recipient_id = ?) AND confirmed = true", id, id)
  end
end
