class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  after_initialize :assign_role

  def assign_role
    self.private = false if self.private.nil?
  end
end
