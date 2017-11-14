class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable :lockable :timeoutable  :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  enum role: [:standard, :premium, :admin]
end
