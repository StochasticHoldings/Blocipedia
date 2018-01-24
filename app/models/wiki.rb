class Wiki < ActiveRecord::Base
   belongs_to :user
   has_many :collaborators
   has_many :users, through: :collaborators, source: :user

   validates :user, presence: true
 end
