class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable :lockable :timeoutable  :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  #has_many :collaborators
  has_one :collaborator
delegate :wiki_collaborations, to: :collaborator
  enum role: [:standard, :premium, :admin]
end
