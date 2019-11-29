class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_languages
  has_many :languages, through: :user_languages

  has_many :reviews  # as a reviewee (user)
  has_many :reviews, as: :author


  before_save :lowercase_city
  has_many :meetups, as: :sender
  has_many :meetups, as: :recipient

# returns all users excluding the user this method is called on
  def all_users_except_me
    User.where.not(id: id)
  end

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

  private

  def lowercase_city
    return if self.city.nil?

    self.city = self.city.lowercase
  end
end
