class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable :lockable :timeoutable  :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

         after_initialize :init
         after_create :send_email


  def send_email
  #  UserMailer.send_email(self).deliver_now
  end

   def init
    self.role  ||= :standard
  end

  enum role: [:standard, :premium, :admin]
end
