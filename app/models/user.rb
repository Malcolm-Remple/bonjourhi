class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :languages, through: :user_languages
  # has_many :meetups, as: :sender
  # has_many :meetups, as: :recipient
  
  def meetups 
    Meetup.where("sender_id = ? OR recipient_id = ?", id, id)
  end
  
  def meetups_i_initiated
    Meetup.where(sender_id: id)
  end
end
