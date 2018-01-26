class Collaborator < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki

  def wiki_collaborations
    []
  end
end
